part of 'feed_filter_cubit.dart';

@freezed
class FeedFilterState with _$FeedFilterState {
  const factory FeedFilterState(
    {required int radius, required bool hideCompleted, required bool hideFarFuture}
  ) = _FeedFilterState;
}
