part of 'general_editor_fields.dart';

class GroupEditorFields extends GeneralEditorFields {
  const GroupEditorFields._({
    required String description,
    required String title,
    required List<VideoUploadCubit> videoUploadCubits,
    required post_visibility visibility,
  }) : super._(
            description: description,
            title: title,
            videoUploadCubits: videoUploadCubits,
            visibility: visibility);
  GroupEditorFields.createEmpty() : super._createEmpty();
  GroupEditorFields.fromGroup(Group group) : super._fromPost(group);

  GroupEditorFields.fromEventEditorFields(EventEditorFields fields)
      : super._(
            description: fields.description,
            visibility: fields.visibility,
            title: fields.title,
            videoUploadCubits: fields.videoUploadCubits);

  GroupEditorFields copyWith({
    String? title,
    String? description,
    post_visibility? visibility,
    List<VideoUploadCubit>? videoUploadCubits,
  }) =>
      GroupEditorFields._(
        description: description ?? this.description,
        title: title ?? this.title,
        videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
        visibility: visibility ?? this.visibility,
      );

  bool validate() {
    return super._validate();
  }

  @override
  List<Object?> get props => [
        ...super.props,
      ];
}
