import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'location_repository.impl.dart';

abstract class LocationRepository {
  Future<String> getLocation();
  Future<void> updateLocation(String location);
}
