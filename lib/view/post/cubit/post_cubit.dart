import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;

  late final StreamSubscription _postSubscription;
  PostCubit(FirestoreId postId, {PostRepository? postRepository})
      : _postRepository = postRepository ?? PostRepositoryImpl(),
        super(const PostState.loading()) {
    _postSubscription =
        _postRepository.subscribeToPost(postId).listen((Post post) {
      emit(PostState.normal(post));
    });
  }

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }
}
