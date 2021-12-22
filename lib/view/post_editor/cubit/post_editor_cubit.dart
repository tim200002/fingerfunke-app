import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'editing_post_model.dart';

part 'post_editor_state.dart';
part 'post_editor_cubit.freezed.dart';

/// class to be used for creating posts with the post editor.
/// Has to be kept in sync with the actual post class

class PostEditorCubit extends Cubit<PostEditorState> {
  PostEditorCubit({String? postID}) : super(const PostEditorState.loading()) {
    init(postID);
  }

  changePostInfo(EditingPost post) {
    emit(PostEditorState.editing(post));
  }

  init(String? postID) {
    if (postID == null) {
      emit(PostEditorState.editing(EditingPost()));
    } else {
      emit(const PostEditorState.error("implement existing post editing"));
    }
  }

  submit(EditingPost post) {
    emit(const PostEditorState.loading());
    emit(const PostEditorState.error("not implemented"));
  }
}
