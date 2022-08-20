import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../repositories/location_repository/location_repository.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

/// Stores current location of the user
class LocationCubit extends Cubit<LocationState> {
  final LocationRepositoryImpl _locationRepositoryImpl =
      LocationRepositoryImpl();
  LocationCubit() : super(const LocationState.loading()) {
    reload();
  }

  void reload() {
    emit(const LocationState.loading());
    _locationRepositoryImpl.getDeviceLocation().then(
        (value) => emit(LocationState.loaded(value)),
        onError: (e) => emit(LocationState.error(e)));
  }

  /*
  /// Returns city of the adress
  String getCity() {
    return state.map(
        initial: (_) => "Lade Standort",
        loaded: (loaded) {
          if (loaded.location.contains('+')) {
            return loaded.location.split(",")[0].trim().split(" ").last;
          }
          return loaded.location.split(",")[1].trim().split(" ").last;
        });
  }*/
}
