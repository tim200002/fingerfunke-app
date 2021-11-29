import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';

class PostPaginationService extends FirestorePaginationService<Post> {
  PostPaginationService(
      {FirebaseFirestore? firestore, int paginationDistance = 10})
      : super(
            (firestore ?? FirebaseFirestore.instance)
                .collection('posts')
                .orderBy('creationTime', descending: true),
            (QueryDocumentSnapshot postDocument) => Post.fromDoc(postDocument),
            paginationDistance: paginationDistance,
            firestore: (firestore ?? FirebaseFirestore.instance));
}
