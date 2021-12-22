part of 'post_editor_cubit.dart';

@freezed
class PostEditorState with _$PostEditorState {
  const factory PostEditorState.loading() = _Loading;
  const factory PostEditorState.editing(EditingPost post) = _Editing;
  const factory PostEditorState.submitting() = _Submitting;
  const factory PostEditorState.submitted() = _Submitted;
  const factory PostEditorState.error(String message) = _Error;
}
