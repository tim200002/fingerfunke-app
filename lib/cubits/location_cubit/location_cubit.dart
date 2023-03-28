import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/place.dart';
import '../../repositories/geocoding_repository/geocodig_repository.dart';
import '../../repositories/storage_repository/storage_repository.dart';
import '../../services/session_info_service.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

/// Stores current location of the user
class LocationCubit extends Cubit<LocationState> {
  final StorageRepository _storageRepository = StorageRepositoryImpl();

  LocationCubit() : super(const LocationState.uninitialized()) {
   loadLocation();
  }


  /// Load devices location (if possible). 
  /// 
  /// We prioritize the devices location, however, if not possible
  /// and a previous location can be found in the storage, we are making use of this
  Future<void> loadLocation() async{
    final PermissionState permissionState = await PermissionState.loadPermissionState();

      // Case 1 Position denied forever
      if (permissionState.locationPermission == LocationPermission.deniedForever) {
        return await _getDeviceLocationFromStorage(permissionState);
      }

      // Case 2 position denied but one can ask
      if (permissionState.locationPermission == LocationPermission.denied || permissionState.locationPermission == LocationPermission.deniedForever) {
        if (!permissionState.locationServiceEnabled) {
          return await _getDeviceLocationFromStorage(permissionState);
        }

        // If location services are enabled, then ask for permission
        final LocationPermission permission =
            await Geolocator.requestPermission();

        // if permission is denied, once again try out storage
        if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
          return await _getDeviceLocationFromStorage(PermissionState(locationPermission: permission, locationServiceEnabled: permissionState.locationServiceEnabled));
        }
        return await _getDeviceLocationFromGps();
      }

      // Case 3 Permission for location given
      else {
        // check whether location services are enabled on device
        if (permissionState.locationServiceEnabled) {
          // If not enabled, then check if location exist in storage use this otherwise deny
          return await _getDeviceLocationFromStorage(permissionState);
        }
        return await _getDeviceLocationFromGps();
      }
  }

  Future<void> _getDeviceLocationFromStorage(PermissionState permissionState) async {
    try {
      final Place? deviceLocationFromStorage =
          _storageRepository.getInfo("device_location");
      if (deviceLocationFromStorage == null) {
        return emit(LocationState.noPosition(permissionState));
      }
      return emit(LocationState.loaded(deviceLocationFromStorage));
    } catch (e) {
      return emit(LocationState.error(e));
    }
  }

  Future<void> _getDeviceLocationFromGps() async {
    try {
      // use location services to get current location
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      final Place place = await GeoCodingRepository.placeFromCoordinate(
          Coordinate(position.latitude, position.longitude));

      // update all the locations where a permission is stored
      SessionInfoService.instance.setLocation(place);
      await _storageRepository.setInfo("device_location", place);

      return emit(LocationState.loaded(place));
    } catch (e) {
      return emit(LocationState.error(e));
    }
  }

  Future<void> setLocation(Place location)async {
    SessionInfoService.instance.setLocation(location);
    await _storageRepository.setInfo("device_location", location);
    emit(LocationState.loaded(location));
  }
}
