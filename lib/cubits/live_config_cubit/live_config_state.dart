part of 'live_config_cubit.dart';

@freezed
class LiveConfigState with _$LiveConfigState {
  const factory LiveConfigState.neutral(
      final bool newFeedItems, final bool pagedFeed) = _Neutral;
}
