import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/asset/asset.dart';
import '../../models/post/post.dart';
import '../../models/user/user.dart';
import '../../utils/type_aliases.dart';

abstract class PostRepository {
  Stream<List<Post>> observeNearbyPosts(
      {required GeoPoint point, required double radius});

  Stream<List<UserInfo>> observePostMembers(String postId);

  Future<void> createPost(Post post);

  Stream<Post> observePost(FirestoreId postId);

  Stream<List<Post>> observePosts(List<FirestoreId>? postIds);

  Stream<List<Post>> observeAuthoredPosts(FirestoreId userId);

  Stream<List<Post>> observeJoinedPosts(FirestoreId userId);

  Future<Post> getPost(FirestoreId postId);

  Future<void> deletePost(FirestoreId postId);

  Future<void> updatePost(FirestoreId postId,
      {PostVisibility? visibility,
      String? title,
      String? description,
      PostPlace? place,
      List<Asset>? media,
      DateTime? startTime});

  Future<void> addPostMember(
      {required FirestoreId postId, required UserInfo user});

  Future<void> removePostMember(
      {required FirestoreId postId, required String userId});
}
