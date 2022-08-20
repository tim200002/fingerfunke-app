part of './location_repository.dart';

/// A service that stores and retrieves the location of the user
class LocationRepositoryImpl implements LocationRepository {
  /// Loads the User's preferred ThemeMode from local storage.

  @override
  Future<Position> getDeviceLocation() {
    return Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium)
        .timeout(const Duration(seconds: 5));
  }
}
