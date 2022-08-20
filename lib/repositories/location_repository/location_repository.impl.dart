part of './location_repository.dart';

/// A service that stores and retrieves the location of the user
class LocationRepositoryImpl implements LocationRepository {
  /// Loads the User's preferred ThemeMode from local storage.

  @override
  Future<Position> getDeviceLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever)
      throw Exception("permission permanently denied");
    if (permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    return Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium)
        .timeout(const Duration(seconds: 5));
  }
}
