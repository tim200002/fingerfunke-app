import 'package:fingerfunke_app/models/post/post.dart';

abstract class PostRepository {
  Future<void> createPost(Post post);
}
