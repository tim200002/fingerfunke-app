part of 'feed_filter_cubit.dart';

@freezed
class FeedFilterState with _$FeedFilterState {
  const factory FeedFilterState.neutral(double distance, bool hideCompleted) =
      _Initial;
}
