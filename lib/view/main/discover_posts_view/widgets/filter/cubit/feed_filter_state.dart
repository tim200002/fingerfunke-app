import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/abstract_models/abstract_models.dart';

part 'feed_filter_state.freezed.dart';
part 'feed_filter_state.g.dart';

@freezed
class FeedFilterState extends Serializable with _$FeedFilterState {
  const factory FeedFilterState(
    {required int radius, required bool hideCompleted, required bool hideFarFuture}
  ) = _FeedFilterState;

   factory FeedFilterState.fromJson(Map<String, dynamic> json) => _$FeedFilterStateFromJson(json);
   
}
