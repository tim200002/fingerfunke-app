import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/repositories/message_repository.dart/message_repository.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class MessageRepositoryImpl implements MessageRepository {
  final FirebaseFirestore _firestore;

  late final CollectionReference _postCollection;

  MessageRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _postCollection = _firestore.collection('posts');
  }

  @override
  Future<void> createMessage(FirestoreId postId, Message message) async {
    await _postCollection
        .doc(postId)
        .collection('messages')
        .doc(message.id)
        .set(message.toJson());
  }
}
