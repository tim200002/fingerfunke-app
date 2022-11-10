import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../repositories/location_repository/location_repository.dart';
import '../../utils/tools.dart';

part 'location_cubit.freezed.dart';

part 'location_state.dart';

/// Stores current location of the user
class LocationCubit extends Cubit<LocationState> {
  final LocationRepository _locationRepository = LocationRepositoryImpl();

  LocationCubit() : super(const LocationState.loading()) {
    reload();
  }

  /// Load current location
  void reload() {
    emit(const LocationState.loading());
    _locationRepository.getLocation().then(
        (value) async => attempt(
            () =>
                emit(LocationState.loaded(value["position"], value["address"])),
            onError: (e) => emit(LocationState.error(e))), onError: (e) {
      emit(e is PermissionDeniedException
          ? const LocationState.denied()
          : LocationState.error(e));
    });
  }

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
      double altitude = 0}) {
    emit(const LocationState.loading());
    emit(LocationState.loaded(
        Position(
            latitude: lat,
            longitude: lng,
            timestamp: timestamp ?? DateTime.now(),
            heading: heading,
            speedAccuracy: speedAccuracy,
            accuracy: accuracy,
            speed: speed,
            altitude: altitude),
        address ?? "Fehler bei der Addressgenerierung"));
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
