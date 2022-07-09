import '../../../../models/user/user.dart';
import '../../../../utils/tools.dart';
import 'cubit/chat_editor_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../utils/type_aliases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatEditor extends StatefulWidget {
  final FirestoreId postId;
  final User author;

  const ChatEditor({required this.postId, required this.author, Key? key})
      : super(key: key);

  @override
  State<ChatEditor> createState() => _ChatEditorState();
}

class _ChatEditorState extends State<ChatEditor> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatEditorCubit>(
      create: (context) =>
          ChatEditorCubit(postId: widget.postId, author: widget.author),
      child: Builder(
        builder: (context) {
          final ChatEditorCubit chatEditorCubit =
              BlocProvider.of<ChatEditorCubit>(context);
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      minLines: 1,
                      maxLines: 6,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _controller,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 25),
                        border: InputBorder.none,
                        hintText: "neue Nachricht",
                      ),
                      onChanged: (value) =>
                          chatEditorCubit.validateMessage(value),
                    ),
                  ),
                ),
                BlocBuilder<ChatEditorCubit, ChatEditorState>(
                  builder: (context, state) => IconButton(
                    onPressed: state.isValid
                        ? () => chatEditorCubit
                            .postMessage(_controller.text)
                            .then((_) => _controller.clear())
                            .onError((_, __) => Tools.showSnackbar(context,
                                "Sorry wir konnten deine Nachricht leider nicht absenden"))
                        : null,
                    icon: Icon(
                      Icons.send_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
