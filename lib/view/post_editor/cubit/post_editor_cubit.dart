import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'editing_post_model.dart';

part 'post_editor_cubit.freezed.dart';
part 'post_editor_state.dart';

/// Class that holds the logic for interacting with the post editor
class PostEditorCubit extends Cubit<PostEditorState> {
  PostEditorCubit({String? postID}) : super(const PostEditorState.loading()) {
    init(postID);
  }

  /// emit a state (in `editing`) with the changed post
  changePostInfo(EditingPost post) {
    emit(PostEditorState.editing(post));
  }

  init(String? postId) {
    (postId == null)
        ? emit(PostEditorState.editing(EditingPost()))
        : loadExistingPost(postId);
  }

  /// function for loading an exiting post from the database and opening it
  /// for editing in the post editor
  loadExistingPost(String postId) async {
    emit(const PostEditorState.loading());
    PostRepositoryImpl().getPost(postId).then(
        (post) => PostEditorState.editing(EditingPost.fromPost(post)),
        onError: (e) => PostEditorState.error(e));
  }

  /// function for deleting a post by passing it's [postId] to the database
  deletePost(String postId) async {
    emit(const PostEditorState.loading());
    PostRepositoryImpl().deletePost(postId).then(
        (_) => emit(const PostEditorState.submitted()),
        onError: (e) => PostEditorState.error(e));
  }

  /// submit and upload a post to the database. returns if post is valid
  submit(EditingPost post, final User? user) {
    if (user == null) return emit(const PostEditorState.error("user invalid"));
    //todo: Post Editor does not have field for location. I'll fix that soon - Robin
    post = post.copyWith(location: "Bielefeld (null)");
    if (!post.isValid())
      return emit(PostEditorState.editing(post, invalid: true));

    emit(const PostEditorState.submitting());
    PostRepositoryImpl().createPost(post.toPost(user)).then(
        (value) => emit(const PostEditorState.submitted()),
        onError: (msg) => emit(PostEditorState.error(msg)));
  }
}
