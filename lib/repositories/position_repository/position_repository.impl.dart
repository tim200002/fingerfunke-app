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
  Future<Position> getDevicePosition(
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
      return Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.medium)
          .timeout(const Duration(seconds: 5));
    }
  }

  /// Returns address of location
  @override
  Future<String> generateAddress(Position pos) async {
    List<geocoding.Placemark> placeMarks =
        await geocoding.placemarkFromCoordinates(pos.latitude, pos.longitude);
    return """${placeMarks[0].street}, ${placeMarks[0].postalCode} ${placeMarks[0].locality}, ${placeMarks[0].country}""";
  }
}
