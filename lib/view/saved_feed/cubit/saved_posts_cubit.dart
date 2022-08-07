import 'package:bloc/bloc.dart';
import '../../../models/post/post.dart';
import '../../../repositories/post_repository/post_repository.dart';
import '../../../repositories/post_repository/post_repository.impl.dart';
import '../../../utils/extensions/first_where_or_null.dart';
import '../../../utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_posts_state.dart';
part 'saved_posts_cubit.freezed.dart';

class SavedPostsCubit extends Cubit<SavedPostsState> {
  final PostRepository _postRepository = PostRepositoryImpl();

  List<Post> posts = [];

  SavedPostsCubit() : super(const SavedPostsState.loading());

  Future<void> updatePosts(List<FirestoreId> updatedPostIds) async {
    print("update");
    // Step 1 delete all posts which are no longer in list
    final filteredPosts =
        posts.where((post) => updatedPostIds.contains(post.id));

    // Step 2 find all posts which must be loaded from sever
    final notYetAddedPosts = [];
    for (FirestoreId postId in updatedPostIds) {
      // see if filteres posts already contain post with same Id
      bool postAlreadyInFilteredPosts =
          filteredPosts.firstWhereOrNull((post) => post.id == postId) != null;
      if (!postAlreadyInFilteredPosts) {
        notYetAddedPosts.add(postId);
      }
    }

    print(notYetAddedPosts);

    List<Future<Post>> newlyFetchedPostsFutures = notYetAddedPosts
        .map((postId) async => await _postRepository.getPost(postId))
        .toList();
    List<Post> newlyFetchedPost = await Future.wait(newlyFetchedPostsFutures);

    final mergedPosts = [...filteredPosts, ...newlyFetchedPost];
    //! Assertion for events not nice
    mergedPosts.sort(
        (a, b) => (a as Event).startTime.compareTo((b as Event).startTime));
    posts = mergedPosts;

    if (posts.isEmpty) {
      return emit(const SavedPostsState.loadedButNothingSaved());
    }
    return emit(SavedPostsState.loaded(posts));
  }

  Future<void> refetchPost(FirestoreId postId) async {
    // fetch post with updated information
    final Post refetchedPost = await _postRepository.getPost(postId);

    // Exchange post in post list
    final List<Post> updatedPosts = posts.map((post) {
      if (post.id == postId) {
        return refetchedPost;
      } else {
        return post;
      }
    }).toList();

    posts = updatedPosts;
    emit(SavedPostsState.loaded(posts));
  }
}
