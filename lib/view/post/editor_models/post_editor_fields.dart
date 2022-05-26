part of 'general_editor_fields.dart';

class EventEditorFields extends GeneralEditorFields {
  final DateTime startTime;

  EventEditorFields._(
      {required String description,
      required String title,
      required List<VideoUploadCubit> videoUploadCubits,
      required post_visibility visibility,
      required this.startTime})
      : super._(
            description: description,
            title: title,
            videoUploadCubits: videoUploadCubits,
            visibility: visibility);

  EventEditorFields.createEmpty()
      : startTime = DateTime.now(),
        super._createEmpty();
  EventEditorFields.fromEvent(Event event)
      : startTime = event.startTime,
        super._fromPost(event);

  EventEditorFields.fromGroupEditorFields(GroupEditorFields fields)
      : startTime = DateTime.now(),
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
          DateTime? startTime}) =>
      EventEditorFields._(
          description: description ?? this.description,
          title: title ?? this.title,
          videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
          visibility: visibility ?? this.visibility,
          startTime: startTime ?? this.startTime);

  bool validate() {
    return super._validate();
  }

  @override
  List<Object?> get props => [...super.props, startTime];
}
