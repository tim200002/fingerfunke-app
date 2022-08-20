import 'dart:async';

import '../../models/asset/asset.dart';
import '../../models/post/post.dart';
import '../../utils/type_aliases.dart';

abstract class PostRepository {
  Stream<List<Post>> observePosts();

  Future<void> createPost(Post post);

  Stream<Post> subscribeToPost(FirestoreId postId);

  Future<Post> getPost(FirestoreId postId);

  Future<void> deletePost(FirestoreId postId);

  Future<void> updatePost(FirestoreId postId,
      {PostVisibility? visibility,
      String? title,
      String? description,
      String? location,
      List<Asset>? media,
      DateTime? startTime});

  /// make current user member of post
  Future<Post> joinPost({required FirestoreId postId});

  Future<Post> leavePost({required FirestoreId postId});
}
