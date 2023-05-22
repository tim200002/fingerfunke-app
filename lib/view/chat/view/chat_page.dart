import 'package:auto_size_text/auto_size_text.dart';
import '../../../common_widgets/paginated_list/paginated_list.dart';
import '../../../cubits/better_pagination/cubit/better_pagination_cubit.dart';
import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../models/message/message.dart';
import '../../../utils/tools.dart';
import '../widgets/chat_message.dart';
import '../widgets/chat_editor/chat_editor.dart';
import '../../error/exception_view.dart';
import '../../../utils/type_aliases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvalidMessageTypeExcpetion implements Exception {}

class ChatArguments {
  final FirestoreId postId;
  final String? chatName;
  final BetterPaginationCubit<Message> chatMessagePaginationCubit;

  ChatArguments(
      {required this.chatMessagePaginationCubit,
      required this.postId,
      this.chatName});
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ChatArguments;
    return Hero(
      tag: "post_chat",
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close)),
          title: AutoSizeText(
            l10n(context).lbl_chat,
            maxLines: 1,
            minFontSize: 12,
          ),
        ),
        body: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child:  PaginatedList<Message>(
                      cubit: arguments.chatMessagePaginationCubit,
                      reverse: true,
                      initialLoadIndicator: const Center(
                          child: CircularProgressIndicator.adaptive()),
                      itemBuilder: (message) {
                        switch (message.type) {
                          case MessageType.text:
                            return ChatMessage(message as TextMessage);
                          default:
                            return ExceptionView(
                              exception: InvalidMessageTypeExcpetion(),
                            );
                        }
                      },
                      emptyListIndicator: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("No messages",
                            style: Theme.of(context).textTheme.labelMedium),
                      )),
                      endIndicator: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(l10n(context).lbl_chatNoMoreMessages,
                            style: Theme.of(context).textTheme.labelMedium),
                      )),
                      nextItemsLoadingIndicator: const Center(
                          child: CircularProgressIndicator.adaptive()),
                    ),
                ),
                ChatEditor(
                    postId: arguments.postId,
                    author: BlocProvider.of<FirebaseAuthenticationCubitCubit>(
                            context)
                        .getUser()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
