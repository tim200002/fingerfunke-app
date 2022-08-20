part of 'general_editor_fields.dart';

class EventEditorFields extends GeneralEditorFields {
  final DateTime startTime;
  final PostPlace? place;

  const EventEditorFields._(
      {required String description,
      required String title,
      required List<VideoUploadCubit> videoUploadCubits,
      required PostVisibility visibility,
      required this.startTime,
      required this.place})
      : super._(
            description: description,
            title: title,
            videoUploadCubits: videoUploadCubits,
            visibility: visibility);

  EventEditorFields.createEmpty()
      : startTime = DateTime.now(),
        place = null,
        super._createEmpty();
  EventEditorFields.fromEvent(Event event)
      : startTime = event.startTime,
        place = event.place,
        super._fromPost(event);

  EventEditorFields.fromGroupEditorFields(GroupEditorFields fields)
      : startTime = DateTime.now(),
        place = null,
        super._(
            description: fields.description,
            visibility: fields.visibility,
            title: fields.title,
            videoUploadCubits: fields.videoUploadCubits);

  EventEditorFields copyWith(
          {String? title,
          String? description,
          PostVisibility? visibility,
          List<VideoUploadCubit>? videoUploadCubits,
          DateTime? startTime,
          PostPlace? place}) =>
      EventEditorFields._(
          description: description ?? this.description,
          title: title ?? this.title,
          videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
          visibility: visibility ?? this.visibility,
          startTime: startTime ?? this.startTime,
          place: place ?? this.place);

  bool validate() {
    return super._validate() && place != null;
  }

  @override
  List<Object?> get props => [...super.props, startTime, place];
}
