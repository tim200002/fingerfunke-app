import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';

part 'position_repository.impl.dart';

abstract class PositionRepository {
  Future<Position> getDevicePosition({bool request = false});
  Future<String> generateAddress(Position position);
}
