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
  final FirebaseFunctions _functions;
  final Geoflutterfire _geo = Geoflutterfire();
  late final CollectionReference _postCollection;
  static const FirestoreId postMemberCollection = "members";

  PostRepositoryImpl(
      {FirebaseFirestore? firestore, FirebaseFunctions? functions})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _functions =
            functions ?? FirebaseFunctions.instanceFor(region: 'europe-west3') {
    _postCollection = _firestore.collection('posts');
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
    if (radius == null) return subscribeToPosts(null);
    var stream = _geo
        .collection(collectionRef: _postCollection)
        .within(
            center: GeoFirePoint(point.latitude, point.longitude),
            radius: radius,
            field: "place")
        .map((doc) => doc.map((doc) => Post.fromDoc(doc)).toList());
    return worker != null ? stream.map(worker) : stream;
  }

  @override
  Stream<Post> subscribeToPost(FirestoreId postId) {
    return _postCollection.doc(postId).snapshots().map(
          (DocumentSnapshot doc) => Post.fromDoc(doc),
        );
  }

  @override
  Stream<List<Post>> subscribeToPosts(List<FirestoreId>? postIds) {
    return (postIds != null
            ? _postCollection.where('id', whereIn: postIds)
            : _postCollection)
        .snapshots()
        .map(
          (r) => r.docs.map((d) => Post.fromDoc(d)).toList(),
        );
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
    final Map<String, dynamic> updateMap = {
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
          {required FirestoreId postId, required UserInfo user}) =>
      _postCollection
          .doc(postId)
          .collection(postMemberCollection)
          .doc(user.id)
          .set(user.toJson());

  @override
  Future<void> removePostMember(
          {required FirestoreId postId, required String userId}) =>
      _postCollection
          .doc(postId)
          .collection(postMemberCollection)
          .doc(userId)
          .delete();

  @override
  Stream<List<UserInfo>> observePostMembers(FirestoreId postId) {
    return _postCollection
        .doc(postId)
        .collection(postMemberCollection)
        .snapshots()
        .map((event) => event.docs.map((u) => UserInfo.fromDoc(u)).toList());
  }
}
