import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.dart';
import 'package:uuid/uuid.dart';

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firestore;
  final uuid = const Uuid();
  late final CollectionReference _postCollection;

  PostRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _postCollection = _firestore.collection('posts');
  }

  @override
  Future<void> createPost(PostWithoutId post) async {
    final String id = uuid.v4();
    await _postCollection.doc(id).set(
          Post.fromJson(
            {...post.toJson(), 'id': id},
          ).toJson(),
        );
  }
}
