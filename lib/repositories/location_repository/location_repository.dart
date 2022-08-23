import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'location_repository.impl.dart';

abstract class LocationRepository {
  Future<Position> getDeviceLocation();
  Future<Position> getLocation();
  Future<void> updateLocation(Position position);
}
