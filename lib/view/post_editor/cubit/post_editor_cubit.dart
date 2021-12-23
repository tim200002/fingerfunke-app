import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'editing_post_model.dart';

part 'post_editor_state.dart';
part 'post_editor_cubit.freezed.dart';

/// Class that holds the logic for interacting with the post editor
class PostEditorCubit extends Cubit<PostEditorState> {
  PostEditorCubit({String? postID}) : super(const PostEditorState.loading()) {
    init(postID);
  }

  /// emit a state (in `editing`) with the changed post
  changePostInfo(EditingPost post) {
    emit(PostEditorState.editing(post, false));
  }

  init(String? postID) {
    if (postID == null) {
      emit(PostEditorState.editing(EditingPost(), false));
    } else {
      emit(const PostEditorState.error("implement existing post editing"));
    }
  }

  /// submit and upload a post to the database. returns if post is valid
  submit(EditingPost post, User? user) {
    if (user == null) return emit(const PostEditorState.error("user invalid"));
    //todo differentiate whether editing existent
    post = post.copyWith(
        id: const Uuid().v4(),
        author: user,
        creationTime: DateTime.now(),
        visibility: post_visibility.visible,
        location: "Bielefeld (null)");
    if (!post.isValid()) return emit(PostEditorState.editing(post, true));
    _disposeCubits();
    emit(const PostEditorState.submitting());
    PostRepositoryImpl().createPost(post.toPost()).then(
        (value) => emit(const PostEditorState.submitted()),
        onError: (msg) => emit(PostEditorState.error(msg)));
  }

  void abortVideoUpload(String cubitId) {
    state.maybeMap(
        editing: (state) {
          final cubitToDelete = state.post.uploadCubits
              .firstWhere((cubit) => cubit.id == cubitId);
          cubitToDelete.close();
          emit(state.copyWith(
              post: state.post.copyWith(
                  uploadCubits: state.post.uploadCubits
                      .where((cubit) => cubit.id != cubitId)
                      .toList())));
        },
        orElse: () => InvalidStateException());
  }

  void _disposeCubits() {
    state.whenOrNull(editing: (post, _) {
      for (var cubit in post.uploadCubits) {
        cubit.close();
      }
    });
  }
}
