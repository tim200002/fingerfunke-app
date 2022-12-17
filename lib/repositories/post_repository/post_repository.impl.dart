import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import '../../models/asset/asset.dart';
import '../../models/post/post.dart';
import '../../models/user/user.dart';
import '../../models/utils.dart';
import '../../utils/type_aliases.dart';
import 'post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firestore;
  final Geoflutterfire _geo = Geoflutterfire();
  late final CollectionReference _postCollection;
  late final CollectionReference _userCollection;
  static const FirestoreId postMemberCollection = "posts_members";

  PostRepositoryImpl(
      {FirebaseFirestore? firestore, FirebaseFunctions? functions})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _postCollection = _firestore.collection('posts');
    _userCollection = _firestore.collection('users');
  }

  @override
  Future<void> createPost(Post post) async {
    var postJson = post.toJson();
    await _postCollection.doc(post.id).set(postJson);
  }

  @override
  Stream<List<Post>> observeNearbyPosts(
      {required GeoPoint point,
      required double? radius,
      final List<Post> Function(List<Post> posts)? worker}) {
    //! fetching all posts is more for debug purposes.
    // When moving to production, this should be disabled
    print("fetch: $radius");
    if (radius == null) return observePosts(null);
    var stream = _geo
        .collection(
            collectionRef: _postCollection as Query<Map<String, dynamic>>)
        .within(
            center: GeoFirePoint(point.latitude, point.longitude),
            radius: radius,
            field: "place")
        .map((doc) => doc.map((doc) => Post.fromDoc(doc)).toList());
    return worker != null ? stream.map(worker) : stream;
  }

  @override
  Stream<Post> observePost(FirestoreId postId) {
    return _postCollection.doc(postId).snapshots().map(
          (DocumentSnapshot doc) => Post.fromDoc(doc),
        );
  }

  @override
  Stream<List<Post>> observePosts(List<FirestoreId>? postIds) {
    //TODO: handle the case, that the user has no saved posts in a better way
    if (postIds?.isEmpty ?? false) postIds = ["none"];
    return (postIds != null
            ? _postCollection.where('id', whereIn: postIds)
            : _postCollection)
        .snapshots()
        .map(
          (r) => r.docs.map((d) => Post.fromDoc(d)).toList(),
        );
  }

  @override
  Stream<List<Post>> observeAuthoredPosts(FirestoreId userId) {
    return _postCollection
        .where('author.id', isEqualTo: userId)
        .snapshots()
        .map((r) => r.docs.map((d) => Post.fromDoc(d)).toList());
  }

  @override
  Future<Post> getPost(FirestoreId postId) {
    return _postCollection.doc(postId).get().then((doc) => Post.fromDoc(doc));
  }

  @override
  Future<void> deletePost(FirestoreId postId) {
    return _postCollection.doc(postId).delete();
  }

  @override
  Future<void> updatePost(FirestoreId postId,
      {PostVisibility? visibility,
      String? title,
      String? description,
      PostPlace? place,
      List<Asset>? media,
      DateTime? startTime}) async {
    //TODO: würde diese Methode nicht ungesetzte Felder mit null überschreiben?
    final JsonMap updateMap = {
      'visibility': visibility?.name,
      'title': title,
      'description': description,
      'place': place?.toJson(),
      'media': media?.map((asset) => asset.toJson()).toList(),
      'startTime': startTime != null ? dateToJson(startTime) : null
    }..removeWhere((key, value) => value == null);

    _postCollection.doc(postId).update(updateMap);
  }

  @override
  Future<void> addPostMember(
          {required FirestoreId postId, required FirestoreId userId}) =>
      _postCollection.doc(postId).update({
        "members": FieldValue.arrayUnion([userId])
      });

  @override
  Future<void> removePostMember(
          {required FirestoreId postId, required FirestoreId userId}) =>
      _postCollection.doc(postId).update({
        "members": FieldValue.arrayRemove([userId])
      });

  @override
  Future<List<UserInfo>> getPostMembers(Post post) async {
    final List<UserInfo> members = [];

    for (FirestoreId userId in post.members) {
      members.add(UserInfo.fromDoc(await _userCollection.doc(userId).get()));
    }
    return members;
  }

  @override
  Stream<List<Post>> observeJoinedPosts(FirestoreId userId) => _postCollection
      .where("members", arrayContains: userId)
      .snapshots()
      .map((e) => e.docs.map((d) => Post.fromDoc(d)).toList());
}
