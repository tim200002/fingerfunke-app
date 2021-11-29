import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class MessagePaginationService extends FirestorePaginationService<Message> {
  MessagePaginationService(FirestoreId postId,
      {FirebaseFirestore? firestore, int paginationDistance = 10})
      : super(
            (firestore ?? FirebaseFirestore.instance)
                .collection('posts')
                .doc(postId)
                .collection('messages')
                .orderBy('creationTime', descending: true),
            (QueryDocumentSnapshot messageDocument) =>
                Message.fromDoc(messageDocument),
            paginationDistance: paginationDistance,
            firestore: (firestore ?? FirebaseFirestore.instance));
}
