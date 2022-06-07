part of 'general_editor_fields.dart';

class EventEditorFields extends GeneralEditorFields {
  final DateTime startTime;
  final String location;

  EventEditorFields._(
      {required String description,
      required String title,
      required List<VideoUploadCubit> videoUploadCubits,
      required post_visibility visibility,
      required this.startTime,
      required this.location})
      : super._(
            description: description,
            title: title,
            videoUploadCubits: videoUploadCubits,
            visibility: visibility);

  EventEditorFields.createEmpty()
      : startTime = DateTime.now(),
        location = "",
        super._createEmpty();
  EventEditorFields.fromEvent(Event event)
      : startTime = event.startTime,
        location = "",
        super._fromPost(event);

  EventEditorFields.fromGroupEditorFields(GroupEditorFields fields)
      : startTime = DateTime.now(),
        location = "",
        super._(
            description: fields.description,
            visibility: fields.visibility,
            title: fields.title,
            videoUploadCubits: fields.videoUploadCubits);

  EventEditorFields copyWith(
          {String? title,
          String? description,
          post_visibility? visibility,
          List<VideoUploadCubit>? videoUploadCubits,
          DateTime? startTime,
          String? location}) =>
      EventEditorFields._(
          description: description ?? this.description,
          title: title ?? this.title,
          videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
          visibility: visibility ?? this.visibility,
          startTime: startTime ?? this.startTime,
          location: location ?? this.location);

  bool validate() {
    return super._validate();
  }

  @override
  List<Object?> get props => [...super.props, startTime, location];
}
