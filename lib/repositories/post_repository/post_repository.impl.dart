import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../models/asset/asset.dart';
import '../../models/post/post.dart';
import '../../models/utils.dart';
import '../../utils/type_aliases.dart';
import 'post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;
  late final CollectionReference _postCollection;

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
  Stream<List<Post>> observePosts() {
    return _postCollection.snapshots().map(
          (snap) => snap.docs.map((doc) => Post.fromDoc(doc)).toList(),
        );
  }

  @override
  Stream<Post> subscribeToPost(FirestoreId postId) {
    return _postCollection.doc(postId).snapshots().map(
          (DocumentSnapshot doc) => Post.fromDoc(doc),
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
      String? location,
      List<Asset>? media,
      DateTime? startTime}) async {
    final Map<String, dynamic> updateMap = {
      'visibility': visibility?.name,
      'title': title,
      'description': description,
      'location': location,
      'media': media?.map((asset) => asset.toJson()).toList(),
      'startTime': startTime != null ? dateToJson(startTime) : null
    }..removeWhere((key, value) => value == null);

    _postCollection.doc(postId).update(updateMap);
  }

  Future<Post> _changeMemberOnPost(FirestoreId postId, bool join) async {
    HttpsCallable callable =
        _functions.httpsCallable(join ? 'post-joinPost' : 'post-leavePost');
    final resp = await callable.call(postId);

    final updatedPostResult = Post.fromJson(json.decode(resp.data));
    return updatedPostResult;
  }

  @override
  Future<Post> joinPost({required FirestoreId postId}) =>
      _changeMemberOnPost(postId, true);

  @override
  Future<Post> leavePost({required FirestoreId postId}) =>
      _changeMemberOnPost(postId, false);
}
