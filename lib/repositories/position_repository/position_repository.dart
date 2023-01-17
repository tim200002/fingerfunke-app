import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';

import '../../models/place.dart';

part 'position_repository.impl.dart';

abstract class PositionRepository {
  Future<Coordinate> getDevicePosition({bool request = false});
  Future<String> generateAddress(Coordinate position);
}
