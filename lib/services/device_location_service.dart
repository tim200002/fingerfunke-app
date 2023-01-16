import '../models/place.dart';
import '../repositories/position_repository/position_repository.dart';

class LocationService {
  static PositionRepository _positionRep = PositionRepositoryImpl();

  /// get the location of the user. This matches to the user's device-
  /// location
  static Future<Place> getLocation({bool request = true}) async =>
      await _getSensorLocation(request);

  /// get a location from the device sensor and match it to a location
  static Future<Place> _getSensorLocation(bool request) async {
    Coordinate position =
        await _positionRep.getDevicePosition(request: request);
    return await placeFromCoordinate(position);
  }

  /// transforms a [position] to a Place. As part of this, it also
  /// generates an address
  static Future<Place> placeFromCoordinate(Coordinate position,
      [String? address]) async {
    address = address ?? (await _positionRep.generateAddress(position));
    return Place(position: position, address: address);
  }
}
