import '../../cubits/abstract_post_editor_cubit/post_update_tracker.dart';

class EventUpdateTracker extends PostUpdateTracker {
  const EventUpdateTracker({int? updatePlaceCounter})
      : super(updatePlaceCounter: updatePlaceCounter ?? 0);

  @override
  EventUpdateTracker addUpdatePlace() {
    return super.addUpdatePlace() as EventUpdateTracker;
  }

  @override
  EventUpdateTracker copyWith({int? updatePlaceCounter}) => EventUpdateTracker(
      updatePlaceCounter: updatePlaceCounter ?? this.updatePlaceCounter);

  @override
  List<Object?> get props => [...super.props];
}
