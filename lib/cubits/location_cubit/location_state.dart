part of 'location_cubit.dart';

class PermissionState extends Equatable {
  final LocationPermission locationPermission;
  final bool locationServiceEnabled;

  const PermissionState(
      {required this.locationPermission, required this.locationServiceEnabled});

  static Future<PermissionState> loadPermissionState() async {
    final LocationPermission locationPermission =
        await Geolocator.checkPermission();
    final bool locationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();

    return PermissionState(
        locationPermission: locationPermission,
        locationServiceEnabled: locationServiceEnabled);
  }

  @override
  List<Object?> get props => [locationPermission, locationServiceEnabled];
}

@freezed
class LocationState with _$LocationState {
  const factory LocationState.uninitialized() = _Uninitialized;
  const factory LocationState.error(dynamic e) = _Error;
  const factory LocationState.noPosition(PermissionState permissionState) = _NoPosition;
  const factory LocationState.loaded(Place location) = _Loaded;
}
