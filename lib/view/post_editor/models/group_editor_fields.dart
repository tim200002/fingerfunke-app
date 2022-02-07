part of 'general_editor_fields.dart';

class GroupEditorFields extends GeneralEditorFields {
  GroupEditorFields._({
    required TextEditingController descriptionController,
    required TextEditingController titleController,
    required List<VideoUploadCubit> videoUploadCubits,
    required post_visibility visibility,
  }) : super._(
            descriptionController: descriptionController,
            titleController: titleController,
            videoUploadCubits: videoUploadCubits,
            visibility: visibility);
  GroupEditorFields.createEmpty() : super._createEmpty();
  GroupEditorFields.fromGroup(Group group) : super._fromPost(group);

  GroupEditorFields.fromEventEditorFields(EventEditorFields fields)
      : super._(
            descriptionController: fields.descriptionController,
            visibility: fields.visibility,
            titleController: fields.titleController,
            videoUploadCubits: fields.videoUploadCubits);

  GroupEditorFields copyWith({
    final post_visibility? visibility,
    final List<VideoUploadCubit>? videoUploadCubits,
  }) =>
      GroupEditorFields._(
        descriptionController: descriptionController,
        titleController: titleController,
        videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
        visibility: visibility ?? this.visibility,
      );

  bool validate() {
    return super._validate();
  }
}
