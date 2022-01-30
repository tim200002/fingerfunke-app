part of 'live_config_cubit.dart';

@freezed
class LiveConfigState with _$LiveConfigState {
  const factory LiveConfigState.neutral({required bool newFeedItems}) =
      _Neutral;
}
