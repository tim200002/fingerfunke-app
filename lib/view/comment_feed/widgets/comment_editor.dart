import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/message_repository.dart/message_repository.dart';
import 'package:fingerfunke_app/repositories/message_repository.dart/message_repository.impl.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentEditor extends StatelessWidget {
  final FirestoreId _postId;
  final MessageRepository _messageRepository = MessageRepositoryImpl();

  CommentEditor(this._postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                border: InputBorder.none,
                labelText: "neuer Kommentar",
                suffixIcon: IconButton(
                  onPressed: () {
                    DevTools.showToDoSnackbar(context);
                    final User? currentUser =
                        BlocProvider.of<AuthenticationCubit>(context)
                            .state
                            .whenOrNull(signedIn: (user) => user);
                    _messageRepository.createMessage(
                        _postId,
                        VideoMessage.createWithId(
                            author: currentUser!,
                            video:
                                "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4"));
                  },
                  icon: const Icon(Icons.video_call_rounded),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              DevTools.showToDoSnackbar(context);
              final User? currentUser =
                  BlocProvider.of<AuthenticationCubit>(context)
                      .state
                      .whenOrNull(signedIn: (user) => user);
              _messageRepository.createMessage(
                  _postId,
                  TextMessage.createWithId(
                      author: currentUser!,
                      text:
                          "Test message sent at ${DateTime.now().toString()}"));
            },
            icon: const Icon(Icons.send_rounded),
          ),
        )
      ],
    );
  }
}
