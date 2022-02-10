import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/message_repository.dart/message_repository.dart';
import 'package:fingerfunke_app/repositories/message_repository.dart/message_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'chat_editor_state.dart';
part 'chat_editor_cubit.freezed.dart';

class ChatEditorCubit extends Cubit<ChatEditorState> {
  final FirestoreId postId;
  final User author;

  final MessageRepository _messageRepository = MessageRepositoryImpl();
  ChatEditorCubit({required this.postId, required this.author})
      : super(const ChatEditorState());

  void validateMessage(String message) {
    if (message.isNotEmpty) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.copyWith(isValid: false));
    }
  }

  Future<void> postMessage(String message) async {
    if (state.isValid) {
      await _messageRepository.createMessage(
        postId,
        TextMessage.createWithId(author: author, text: message),
      );
      emit(state.copyWith(isValid: false));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
