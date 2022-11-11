import 'package:geolocator/geolocator.dart';

import '../models/user_location.dart';
import '../repositories/position_repository/position_repository.dart';
import '../repositories/storage_repository/storage_repository.dart';

class LocationService {
  final StorageRepository _storageRep = StorageRepositoryImpl();
  final PositionRepository _positionRep = PositionRepositoryImpl();

  /// get the location of the user. This either matches to the user's device-
  /// location or the one he has set using the search.
  /// The result will be persisted into local storage
  Future<UserLocation> getLocation({bool request = true}) async =>
      _save(_storageRep.getLocation() ?? (await _getSensorLocation(request)));

  /// set the location within the app. The function also saves the location
  /// to local storage
  Future<UserLocation> setPosition(Position position) async =>
      _save(await _locationFromPosition(position));

  /// get a location from the device sensor and match it to a location
  Future<UserLocation> _getSensorLocation(bool request) async {
    Position position = await _positionRep.getDevicePosition(request: request);
    return await _locationFromPosition(position);
  }

  /// transforms a [position] to a UserLocation. As part of this, it also
  /// generates an address
  Future<UserLocation> _locationFromPosition(Position position) async {
    String address = await _positionRep.generateAddress(position);
    return UserLocation(position: position, address: address);
  }

  /// saves a [location] to local storage and returns it
  Future<UserLocation> _save(UserLocation location) async {
    await _storageRep.setLocation(location);
    return location;
  }
}
