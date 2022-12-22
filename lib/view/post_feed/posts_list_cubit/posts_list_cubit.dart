import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/post/post.dart';
import '../../../repositories/post_repository/post_repository.dart';
import '../../../repositories/post_repository/post_repository.impl.dart';

part 'posts_list_cubit.freezed.dart';
part 'posts_list_state.dart';

typedef PostQuery = Stream<List<Post>> Function();
typedef PostFilter = List<Post> Function(List<Post>);

class PostsListCubit extends Cubit<PostsListState> {
  static final PostRepository _postRepository = PostRepositoryImpl();

  /// query all documents of which the [postIds] are passed
  static Stream<List<Post>> queryPostsByIds(List<String> postIds) =>
      _postRepository.observePosts(postIds);

  static Stream<List<Post>> queryJoinedPosts(String userId) =>
      _postRepository.observeJoinedPosts(userId);

  static Stream<List<Post>> queryAuthorPosts(String userId) =>
      _postRepository.observeAuthoredPosts(userId);

  final PostQuery query;
  final PostFilter? filter;

  PostsListCubit(this.query, {this.filter})
      : super(const PostsListState.loading()) {
    refresh();
  }

  void refresh() async {
    query().listen(
        (p) => emit(PostsListState.neutral((filter ?? (l) => l).call(p))),
        onError: (e) => emit(PostsListState.error(e)));
  }
}
