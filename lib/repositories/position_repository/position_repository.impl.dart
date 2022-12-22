part of 'position_repository.dart';

class AppPermissionDeniedException implements Exception {
  bool permanent;
  AppPermissionDeniedException({required this.permanent});
  String errMsg() =>
      'a permission was denied by the user ' +
      (permanent ? "permanently" : "temporarily");
}

/// A service that stores and retrieves the location of the user
class PositionRepositoryImpl implements PositionRepository {
  /// Generates current location
  @override
  Future<Coordinate> getDevicePosition(
      {LocationPermission? existingPermission, bool request = false}) async {
    final LocationPermission permission =
        existingPermission ?? await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw AppPermissionDeniedException(permanent: true);
    } else if (permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.denied) {
      if (!request) throw AppPermissionDeniedException(permanent: false);
      LocationPermission res = await Geolocator.requestPermission();
      return getDevicePosition(existingPermission: res, request: false);
    } else {
      final Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.medium).timeout(const Duration(seconds: 5));
      return Coordinate(position.latitude, position.longitude);
    }
  }

  /// Returns address of location
  @override
  Future<String> generateAddress(Coordinate position) async {
    List<geocoding.Placemark> placeMarks =
        await geocoding.placemarkFromCoordinates(position.latitude, position.longitude);
    return """${placeMarks[0].street}, ${placeMarks[0].postalCode} ${placeMarks[0].locality}, ${placeMarks[0].country}""";
  }
}
