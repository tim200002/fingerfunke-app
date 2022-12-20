import '../models/place.dart';
import '../repositories/position_repository/position_repository.dart';
import '../repositories/storage_repository/storage_repository.dart';

class LocationService {
  final StorageRepository _storageRep = StorageRepositoryImpl();
  final PositionRepository _positionRep = PositionRepositoryImpl();

  /// get the location of the user. This either matches to the user's device-
  /// location or the one he has set using the search.
  /// The result will be persisted into local storage
  Future<Place> getLocation({bool request = true}) async =>
      _save(_storageRep.getLocation() ?? (await _getSensorLocation(request)));

  /// set the location within the app. The function also saves the location
  /// to local storage
  /// 
  /// Function always saves location as a place object. One can either provide
  /// a place or a position where the adress is then inferred. If both is provided
  /// place is prioritized
  Future<Place> setPosition({Coordinate? position, Place? place}) async {
    if(place != null){
      return _save(place);
    }
    if(position != null){
      return _save(await _locationFromPosition(position));
    }
    throw Exception("At least a position or place must be provided");
  }
      

  /// get a location from the device sensor and match it to a location
  Future<Place> _getSensorLocation(bool request) async {
    Coordinate position = await _positionRep.getDevicePosition(request: request);
    return await _locationFromPosition(position);
  }

  /// transforms a [position] to a UserLocation. As part of this, it also
  /// generates an address
  Future<Place> _locationFromPosition(Coordinate position) async {
    String address = await _positionRep.generateAddress(position);
    return Place(position: position, address: address);
  }

  /// saves a [location] to local storage and returns it
  Future<Place> _save(Place location) async {
    await _storageRep.setLocation(location);
    return location;
  }
}
