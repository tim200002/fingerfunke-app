import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/post/post.dart';
import '../../../../repositories/post_repository/post_repository.dart';
import '../../../../repositories/post_repository/post_repository.impl.dart';
import '../../../../repositories/user_repository/user_repository.dart';
import '../../../../utils/exceptions.dart';
import '../../../../utils/type_aliases.dart';

part 'post_cubit.freezed.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;
  final UserRepository _userRepository = UserRepositoryImpl();

  late final StreamSubscription _postSubscription;
  PostCubit(FirestoreId postId, {PostRepository? postRepository})
      : _postRepository = postRepository ?? PostRepositoryImpl(),
        super(PostState.loading(postId)) {
    _postSubscription =
        _postRepository.subscribeToPost(postId).listen((Post post) {
      print("post update");
      emit(
        PostState.normal(
          post: post,
        ),
      );
    });
  }

  Future<void> deletePost() async {
    state.whenOrNull(normal: (post, _) => _postRepository.deletePost(post.id));
  }

  Future<void> toggleIsParticipant(bool isParticipant) async {
    state.maybeMap(
        normal: (state) async {
          emit(state.copyWith(isJoining: true));
          try {
            final updatedPost = isParticipant
                ? await _postRepository.leavePost(postId: state.post.id)
                : await _postRepository.joinPost(postId: state.post.id);

            emit(PostState.normal(post: updatedPost, isJoining: false));
          } catch (_) {
            //emit(state.copyWith(isJoining: false));
            rethrow;
          }
        },
        orElse: () => throw (InvalidStateException()));
  }

  Future<void> toggleSaved(FirestoreId userId, bool hasSaved) async {
    final postId =
        state.when(loading: (postId) => postId, normal: (post, _) => post.id);
    if (!hasSaved) {
      _userRepository.savePost(userId, postId);
    } else {
      _userRepository.unsavePost(userId, postId);
    }
  }

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }
}
