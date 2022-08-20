import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/asset/asset.dart';
import '../../models/post/post.dart';
import '../../utils/type_aliases.dart';

abstract class PostRepository {
  Stream<List<Post>> observeNearbyPosts(
      {required GeoPoint point, required double radius});

  Future<void> createPost(Post post);

  Stream<Post> subscribeToPost(FirestoreId postId);

  Future<Post> getPost(FirestoreId postId);

  Future<void> deletePost(FirestoreId postId);

  Future<void> updatePost(FirestoreId postId,
      {PostVisibility? visibility,
      String? title,
      String? description,
      PostPlace? place,
      List<Asset>? media,
      DateTime? startTime});

  /// make current user member of post
  Future<Post> joinPost({required FirestoreId postId});

  Future<Post> leavePost({required FirestoreId postId});
}
