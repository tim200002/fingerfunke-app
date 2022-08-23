import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

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
    _locationRepositoryImpl.getLocation().then(
        (value) async => emit(LocationState.loaded(value, await generateAddress(value.longitude, value.latitude))),
        onError: (e) => emit(LocationState.error(e)));
  }

  /// Returns address of location
  String getAddress() {
    return state.map(
        loading: (_) => "Lade Standort",
        error: (_) => "Fehler",
        loaded: (loaded) {
          if (loaded.address.contains('+')) {
            return loaded.address.split(",")[0].trim().split(" ").last;
          }
          return loaded.address.split(",")[1].trim().split(" ").last;
        },
    );
  }

  /// Returns address of location
  Future<String> generateAddress(double longitude, double latitude) async {
    List<geocoding.Placemark> placeMarks = await geocoding.placemarkFromCoordinates(
      latitude,
      longitude,
    );
    return """${placeMarks[0].street}, ${placeMarks[0].postalCode} ${placeMarks[0].locality}, ${placeMarks[0].country}""";
  }
}
