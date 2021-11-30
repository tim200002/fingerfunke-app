import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/view/comment_feed/comment_feed.dart';
import 'package:fingerfunke_app/view/comment_feed/widgets/comment_editor.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentFeedWithEditor extends StatelessWidget {
  final FirestoreId _postId;
  const CommentFeedWithEditor(this._postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Kommentare",
          style: Theme.of(context).textTheme.headline3,
        ),
        Flexible(
          child: CommentFeed(_postId),
        ),
        BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) => state.maybeWhen(
            signedIn: (_) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CommentEditor(_postId),
            ),
            orElse: () => const Center(
              child: Text("You can only send messages when you are logged in"),
            ),
          ),
        )
      ],
    );
  }
}
