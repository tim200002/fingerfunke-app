import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firestore;
  late final CollectionReference _postCollection;

  PostRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _postCollection = _firestore.collection('posts');
  }

  @override
  Future<void> createPost(Post post) async {
    await _postCollection.doc(post.id).set(post.toJson());
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
  Future<void> joinPost({required Post post, required UserInfo user})async{
    
  }
}
