import '../../models/message/message.dart';
import '../../utils/type_aliases.dart';

abstract class MessageRepository {
  Future<void> createMessage(FirestoreId postId, Message message);

  Future<void> moderateMessage({required String fullPath,
      required bool shouldBeDeleted});
}
