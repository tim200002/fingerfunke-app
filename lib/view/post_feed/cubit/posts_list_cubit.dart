import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/post/post.dart';
import '../../../repositories/post_repository/post_repository.dart';
import '../../../repositories/post_repository/post_repository.impl.dart';
import '../../../utils/type_aliases.dart';

part 'posts_list_state.dart';
part 'posts_list_cubit.freezed.dart';

typedef PostFilter = List<Post> Function(List<Post>);

class PostsListCubit extends Cubit<PostsListState> {
  final PostRepository _postRepository = PostRepositoryImpl();

  final List<FirestoreId> postIds;
  final PostFilter? filter;

  PostsListCubit(this.postIds, {this.filter})
      : super(const PostsListState.loading()) {
    refresh();
  }

  void refresh() async {
    print("running refresh");
    _postRepository.subscribeToPosts(postIds).listen(
        (p) => emit(PostsListState.neutral((filter ?? (l) => l).call(p))),
        onError: (e) => emit(PostsListState.error(e)));
  }
}
