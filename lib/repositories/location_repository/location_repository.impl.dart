part of './location_repository.dart';


/// A service that stores and retrieves the location of the user
class LocationRepositoryImpl implements LocationRepository {

  /// Load location in local storage.
  @override
  Future<Map> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final storedPosition = prefs.getString('position');
    final storedAddress = prefs.getString('address');

    if (storedPosition == null) {
      final currentLocation = await getDeviceLocation();
      await updateLocation(currentLocation);
      return {"position": currentLocation, "address": prefs.getString('address')};
    }
    return {"position": Position.fromMap(jsonDecode(storedPosition)), "address": storedAddress};
  }

  /// Persists location in local storage.
  @override
  Future<void> updateLocation(Position position) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('position', json.encode(position.toJson()));
    prefs.setString('address', json.encode(await generateAddress(position.longitude, position.latitude)));
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

  /// Returns address of location
  Future<String> generateAddress(double longitude, double latitude) async {
    List<geocoding.Placemark> placeMarks = await geocoding.placemarkFromCoordinates(
      latitude,
      longitude,
    );
    return """${placeMarks[0].street}, ${placeMarks[0].postalCode} ${placeMarks[0].locality}, ${placeMarks[0].country}""";
  }
}
