import 'dart:async';

import '../../models/asset/asset.dart';
import '../../models/place.dart';
import '../../models/post/post.dart';
import '../../models/user/user.dart';
import '../../utils/type_aliases.dart';

abstract class PostRepository {
  Future<List<UserInfo>> getPostMembers(Post post);

  Future<void> createPost(Post post);

  Stream<Post> observePost(FirestoreId postId);

  Stream<List<Post>> observePosts(List<FirestoreId>? postIds);

  Stream<List<Post>> observeAuthoredPosts(FirestoreId userId, {bool excludeDeleted=true});

  Stream<List<Post>> observeJoinedPosts(FirestoreId userId, {bool excludeAuthored=false});

  Future<Post> getPost(FirestoreId postId);

  Future<void> deletePost(FirestoreId postId);

  Future<void> updatePost(FirestoreId postId,
      {PostVisibility? visibility,
      String? title,
      String? description,
      Place? place,
      Asset? mainAsset,
      List<Asset>? media,
      DateTime? startTime});

  Future<void> moderatePost(FirestoreId postId, {required bool shouldBeDeleted});

  Future<void> addPostMember(
      {required FirestoreId postId, required FirestoreId userId});

  Future<void> removePostMember(
      {required FirestoreId postId, required FirestoreId userId});
}
