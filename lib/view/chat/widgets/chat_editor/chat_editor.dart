import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/chat/widgets/chat_editor/cubit/chat_editor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatEditor extends StatelessWidget {
  final FirestoreId postId;
  final User author;

  const ChatEditor({required this.postId, required this.author, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatEditorCubit>(
      create: (_) => ChatEditorCubit(postId: postId, author: author),
      child: Builder(builder: (context) {
        final ChatEditorCubit chatEditorCubit =
            BlocProvider.of<ChatEditorCubit>(context);
        return BlocBuilder<ChatEditorCubit, ChatEditorState>(
          builder: (context, state) => Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: state.controller,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                        border: InputBorder.none,
                        labelText: "neue Nachricht",
                      ),
                      onChanged: (_) => chatEditorCubit.validateInput(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: state.isValid
                      ? () => chatEditorCubit.postMessage().onError((_, __) =>
                          Tools.showSnackbar(context,
                              "Sorry wir konnten deine Nachricht leider nicht absenden"))
                      : null,
                  icon: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
