part of './location_repository.dart';

/// A service that stores and retrieves the location of the user
class LocationRepositoryImpl implements LocationRepository {

  /// Load location in local storage.
  @override
  Future<Position> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final storedLocation = prefs.getString('position');

    if (storedLocation == null) {
      final currentLocation = await getDeviceLocation();
      updateLocation(currentLocation);
      return currentLocation;
    }
    return Position.fromMap(jsonDecode(storedLocation));
  }

  /// Persists location in local storage.
  @override
  Future<void> updateLocation(Position position) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('position', json.encode(position.toJson()));
  }

  /// Generates current location
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
