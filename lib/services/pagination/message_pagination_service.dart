import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/message/message.dart';
import '../../utils/type_aliases.dart';
import 'firestore_pagination_service.dart';

class MessagePaginationService extends FirestorePaginationService<Message> {
  MessagePaginationService(FirestoreId postId,
      {FirebaseFirestore? firestore, int paginationDistance = 20})
      : super(
            (firestore ?? FirebaseFirestore.instance)
                .collection('posts')
                .doc(postId)
                .collection('posts_messages')
                .orderBy('creationTime', descending: true),
            (QueryDocumentSnapshot messageDocument) =>
                Message.fromDoc(messageDocument),
            paginationDistance: paginationDistance,
            firestore: (firestore ?? FirebaseFirestore.instance));
}
