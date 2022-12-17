import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/post/post.dart';
import '../../../../repositories/post_repository/post_repository.dart';
import '../../../../repositories/post_repository/post_repository.impl.dart';
import '../../../../repositories/user_repository/user_repository.dart';
import '../../../../utils/type_aliases.dart';

part 'post_cubit.freezed.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;
  final UserRepository _userRepository = UserRepositoryImpl();

  FirestoreId userId;
  late final StreamSubscription _postSubscription;

  PostCubit(FirestoreId postId,
      {required this.userId, PostRepository? postRepository})
      : _postRepository = postRepository ?? PostRepositoryImpl(),
        super(PostState.loading(postId)) {
    _postSubscription = _postRepository.observePost(postId).listen((Post post) {
      emit(
        PostState.normal(post, _userIsMember(post)),
      );
    });
  }

  Future<void> deletePost() async {
    state.whenOrNull(normal: (post, _) => _postRepository.deletePost(post.id));
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

  bool _userIsMember(Post post) => post.members.contains(userId);

  Future<void>? joinPost() => state.whenOrNull<Future<void>>(
      normal: (post, _) =>
          PostRepositoryImpl().addPostMember(postId: post.id, userId: userId));

  Future<void>? leavePost() => state.whenOrNull(
      normal: (post, _) => PostRepositoryImpl()
          .removePostMember(postId: post.id, userId: userId));

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }
}
