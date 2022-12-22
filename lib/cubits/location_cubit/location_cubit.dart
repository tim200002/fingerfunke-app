import 'package:app_settings/app_settings.dart' as app_ettings;
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/place.dart';
import '../../repositories/position_repository/position_repository.dart';
import '../../services/location_service.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

/// Stores current location of the user
class LocationCubit extends Cubit<LocationState> {
  final LocationService _locationService = LocationService();

  LocationCubit() : super(const LocationState.loading()) {
    refresh(request: false);
  }

  /// Load current location
  void refresh({bool request = true}) {
    emit(const LocationState.loading());
    _locationService.getLocation(request: request).then(
        (p) => emit(LocationState.loaded(p)),
        onError: (e) => emit(e is AppPermissionDeniedException
            ? LocationState.denied(e.permanent)
            : LocationState.error(e)));
  }

  Future<void> openSettings() => app_ettings.AppSettings.openAppSettings();

  /// Update location
  void updateLocation(
      // TODO: This can results in incorrect Position objects, but it can't be changed due to the conversion of PickResult into Position
      {required double lat,
      required double lng,
      required String? address
      }) async {
      print("update");
      emit(const LocationState.loading());
      if(address != null){
        Place place = Place(position: Coordinate(lat, lng), address: address);
        return emit(LocationState.loaded(await _locationService.setPosition(place: place)));
      }
      final Coordinate position = Coordinate(lat, lng);
      return emit(LocationState.loaded(await _locationService.setPosition(position: position)));
  }
}
