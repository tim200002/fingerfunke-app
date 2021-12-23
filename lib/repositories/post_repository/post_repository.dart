import 'dart:async';

import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

abstract class PostRepository {
  Future<void> createPost(Post post);

  Stream<Post> subscribeToPost(FirestoreId postId);

  Future<Post> getPost(FirestoreId postId);

  Future<void> deletePost(FirestoreId postId);
}
