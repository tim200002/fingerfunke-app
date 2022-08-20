import 'package:geolocator/geolocator.dart';

part 'location_repository.impl.dart';

abstract class LocationRepository {
  Future<Position> getDeviceLocation();
}
