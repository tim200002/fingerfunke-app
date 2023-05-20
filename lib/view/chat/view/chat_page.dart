import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../../common_widgets/paginated_list/firebase_paginated_list.dart';
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

  ChatArguments({required this.postId, this.chatName});
}

class ChatPage extends StatelessWidget {
  final FirebaseFirestore _firestore = GetIt.I.get<FirebaseFirestore>();

  ChatPage({Key? key}) : super(key: key);

  Query<Message> _getQuery(FirestoreId postId) {
    return _firestore
        .collection('posts')
        .doc(postId)
        .collection('posts_messages')
        .orderBy('creationTime', descending: true)
        .withConverter<Message>(
            fromFirestore: (snapshot, _) => Message.fromDoc(snapshot),
            toFirestore: (message, _) => message.toJson());
  }

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
                    child: FirebasePaginatedList<Message>(
                      reverse: true,
                      initialLoadIndicator: const Center(child: CircularProgressIndicator.adaptive()),
                  query: _getQuery(arguments.postId),
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
                  nextItemsLoadingIndicator:
                      const Center(child: CircularProgressIndicator.adaptive()),
                )),
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
