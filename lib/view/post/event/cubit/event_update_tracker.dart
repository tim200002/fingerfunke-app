import '../../cubits/abstract_post_editor_cubit/post_update_tracker.dart';

class EventUpdateTracker extends PostUpdateTracker {
  const EventUpdateTracker({int? updatePlaceCounter, int? updateMediaCounter})
      : super(
            updatePlaceCounter: updatePlaceCounter ?? 0,
            updateMediaCounter: updateMediaCounter ?? 0);

  @override
  EventUpdateTracker addUpdatePlace() {
    return super.addUpdatePlace() as EventUpdateTracker;
  }

  @override
  EventUpdateTracker copyWith(
          {int? updatePlaceCounter, int? updateMediaCounter}) =>
      EventUpdateTracker(
          updatePlaceCounter: updatePlaceCounter ?? this.updatePlaceCounter,
          updateMediaCounter: updateMediaCounter ?? this.updateMediaCounter);

  @override
  List<Object?> get props => [...super.props];
}
