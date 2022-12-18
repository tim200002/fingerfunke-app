import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/post/post.dart';
import 'firestore_pagination_service.dart';

class PostPaginationService extends FirestorePaginationService<Post> {

  final String geoHashUser;
  final int radius;
  PostPaginationService(this.geoHashUser, this.radius,
      {FirebaseFirestore? firestore, int paginationDistance = 10})
      : super(
            (firestore ?? FirebaseFirestore.instance)
                .collection('posts').
                where('geohashesByRadius[$radius]', arrayContains: geoHashUser)
                .orderBy('creationTime', descending: true),
            (QueryDocumentSnapshot postDocument) => Post.fromDoc(postDocument),
            paginationDistance: paginationDistance,
            firestore: (firestore ?? FirebaseFirestore.instance));
}
