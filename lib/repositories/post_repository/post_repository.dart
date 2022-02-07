import 'dart:async';

import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

abstract class PostRepository {
  Future<void> createPost(Post post);

  Stream<Post> subscribeToPost(FirestoreId postId);

  Future<Post> getPost(FirestoreId postId);

  Future<void> deletePost(FirestoreId postId);

  Future<void> updatePost(FirestoreId postId,
      {post_visibility? visibility,
      String? title,
      String? description,
      String? location,
      List<Asset>? media,
      DateTime? startTime});

  /// make current user member of post
  Future<Post> joinPost({required FirestoreId postId});

  Future<Post> leavePost({required FirestoreId postId});
}
