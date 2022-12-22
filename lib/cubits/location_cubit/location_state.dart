part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.loading() = _loading;
  const factory LocationState.error(dynamic e) = _Error;
  const factory LocationState.denied(bool permanent) = _Denied;
  const factory LocationState.loaded(Place location) = _Loaded;
}
