part of 'post_editor_cubit.dart';

@freezed
class PostEditorState with _$PostEditorState {
  const factory PostEditorState.loading() = _Loading;

  const factory PostEditorState.editEvent(
      {required EventEditorFields eventEditorFields,
      @Default(false) bool inputValid}) = _EditEvent;
  const factory PostEditorState.editGroup(
      {required GroupEditorFields groupEditorFields,
      @Default(false) bool inputValid}) = _EditGroup;
  const factory PostEditorState.submitting() = _Submitting;
  const factory PostEditorState.submitted(String? postId) = _Success;
  const factory PostEditorState.error(String message) = _Error;
  //const factory PostEditorState.invalid() = _Invalid;
}
