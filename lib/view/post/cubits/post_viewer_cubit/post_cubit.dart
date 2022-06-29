import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_cubit.freezed.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;

  late final StreamSubscription _postSubscription;
  PostCubit(FirestoreId postId, {PostRepository? postRepository})
      : _postRepository = postRepository ?? PostRepositoryImpl(),
        super(PostState.loading(postId)) {
    _postSubscription =
        _postRepository.subscribeToPost(postId).listen((Post post) {
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
            emit(state.copyWith(isJoining: false));
            rethrow;
          }
        },
        orElse: () => throw (InvalidStateException()));
  }

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }
}
