part of 'abstract_post_editor_cubit.dart';

@freezed
class PostEditorState with _$PostEditorState {
    const factory PostEditorState.editing(PostUpdateTracker updateTracker, bool valid) = _Editing;
    const factory PostEditorState.submitting() = _Submitting;
    const factory PostEditorState.submitted(String? postId) = _Success;
    const factory PostEditorState.error(String message) = _Error;
}
