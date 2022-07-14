
part of './location_repository.dart';

/// A service that stores and retrieves the location of the user
class LocationRepositoryImpl implements LocationRepository {
  /// Loads the User's preferred ThemeMode from local storage.
  @override
  Future<String> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final storedLocation = prefs.getString('location');

    if (storedLocation == null) {
      final currentLocation = await getCurrentLocation();
      updateLocation(currentLocation);
      return currentLocation;
    }
    return storedLocation;
  }

  /// Persists the location in local storage.
  @override
  Future<void> updateLocation(String location) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('location', location);
  }

  /// Returns Address at current GPS location
  Future<String> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best)
        .timeout(const Duration(seconds: 5));
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      return """${placemarks[0].street}, ${placemarks[0].postalCode} ${placemarks[0].locality}, ${placemarks[0].country}""";
    } catch (err) {
      Logger().e("No address loadable and fetchable");
      return "Keine Adresse";
    }
  }
}