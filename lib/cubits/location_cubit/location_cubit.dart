import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repositories/location_repository/location_repository.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';


/// Stores current location of the user
class LocationCubit extends Cubit<LocationState> {
  final LocationRepositoryImpl _locationRepositoryImpl;
  LocationCubit(this._locationRepositoryImpl) : super(const Initial());

  /// Load the location from local storage
  Future<void> loadLocation() async {
    final location = await _locationRepositoryImpl.getLocation();
    emit(Loaded(location));
  }

  /// Update and persist the users location
  Future<void> updateLocation({String? location}) async {
    if (location == null) return;
    emit(Loaded(location));

    await _locationRepositoryImpl.updateLocation(location);
  }

  /// Returns city of the adress
  String getCity() {
    return state.map(initial: (_) => "Lade Standort", loaded: (loaded) {
      if (loaded.location.contains('+')){
        return loaded.location.split(",")[0].trim().split(" ").last;
      }
      return loaded.location.split(",")[1].trim().split(" ").last;
    });
  }
}
