import 'package:app_settings/app_settings.dart' as aSettings;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/user_location.dart';
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

  Future<void> openSettings() => aSettings.AppSettings.openAppSettings();

  /// Update location
  void updateLocation(
      // TODO: This can results in incorrect Position objects, but it can't be changed due to the conversion of PickResult into Position
      {required double lat,
      required double lng,
      String? address,
      DateTime? timestamp,
      double heading = 0,
      double speedAccuracy = 0,
      double accuracy = 0,
      double speed = 0,
      double altitude = 0}) async {
    emit(const LocationState.loading());
    var position = Position(
        latitude: lat,
        longitude: lng,
        timestamp: timestamp ?? DateTime.now(),
        heading: heading,
        speedAccuracy: speedAccuracy,
        accuracy: accuracy,
        speed: speed,
        altitude: altitude);

    emit(LocationState.loaded(await _locationService.setPosition(position)));
  }

  /// Returns address of location
  String generateAddress(String? address) {
    if (address == null) return "dein Standort";
    if (address.contains('+')) {
      return address.split(",")[0].trim().split(" ").last;
    }
    return address.split(",")[1].trim().split(" ").last;
  }
}
