import 'package:auto_size_text/auto_size_text.dart';
import '../../../common_widgets/list_view/pagination/cubit/paginated_list_cubit.dart';
import '../../../common_widgets/list_view/pagination/view/paginated_list.dart';
import '../../../cubits/app_cubit/app_cubit.dart';
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
  final PaginatedListCubit<Message> paginatedListCubit;
  final String? chatName;

  ChatArguments(
      {required this.postId, required this.paginatedListCubit, this.chatName});
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
                  child: BlocProvider.value(
                    value: arguments.paginatedListCubit,
                    child: PaginatedList<Message>(
                      reverse: true,
                      /*endWidget: const Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: Text("Beginn der Unterhaltung")),
                      ),*/
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
                ChatEditor(
                    postId: arguments.postId,
                    author: BlocProvider.of<AppCubit>(context).state.user),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
