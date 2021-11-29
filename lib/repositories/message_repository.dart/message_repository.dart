import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

abstract class MessageRepository {
  Future<void> createMessage(FirestoreId postId, Message message);
}
