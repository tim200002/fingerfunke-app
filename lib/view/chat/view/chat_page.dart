import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/view/chat/view/chat_message.dart';
import 'package:fingerfunke_app/view/chat/widgets/chat_editor/chat_editor.dart';
import 'package:fingerfunke_app/view/error/exception_view.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/paginated_list/view/paginated_list.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvalidMessageTypeExcpetion implements Exception {}

class ChatArguments {
  final FirestoreId postId;
  final PaginatedListCubit<Message> paginatedListCubit;

  ChatArguments({required this.postId, required this.paginatedListCubit});
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ChatArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: BlocProvider.value(
              value: arguments.paginatedListCubit,
              child: PaginatedList<Message>(
                reverse: true,
                endMessage: "Keine weitere Nachrichten",
                itemBuilder: (message) {
                  switch (message.type) {
                    case message_type.text:
                      return ChatMessage(message as TextMessage);
                    default:
                      return ExceptionView(
                        exception: InvalidMessageTypeException(),
                      );
                  }
                },
              ),
            ),
          ),
          BlocProvider.of<AuthenticationCubit>(context).state.maybeWhen(
              signedIn: (user) =>
                  ChatEditor(postId: arguments.postId, author: user),
              orElse: () =>
                  Text("You must have an account ro participate in this chat"))
        ],
      ),
    );
  }
}
