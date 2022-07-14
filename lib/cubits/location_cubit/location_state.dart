part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;
  const factory LocationState.loaded(String location) = Loaded;
}
