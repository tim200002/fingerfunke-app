part of 'general_editor_fields.dart';

class EventEditorFields extends GeneralEditorFields {
  final DateTime startTime;

  EventEditorFields._(
      {required TextEditingController descriptionController,
      required TextEditingController titleController,
      required List<VideoUploadCubit> videoUploadCubits,
      required post_visibility visibility,
      required this.startTime})
      : super._(
            descriptionController: descriptionController,
            titleController: titleController,
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
            descriptionController: fields.descriptionController,
            visibility: fields.visibility,
            titleController: fields.titleController,
            videoUploadCubits: fields.videoUploadCubits);

  EventEditorFields copyWith(
          {final post_visibility? visibility,
          final List<VideoUploadCubit>? videoUploadCubits,
          final DateTime? startTime}) =>
      EventEditorFields._(
          descriptionController: descriptionController,
          titleController: titleController,
          videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
          visibility: visibility ?? this.visibility,
          startTime: startTime ?? this.startTime);

  bool validate() {
    return super._validate();
  }
}
