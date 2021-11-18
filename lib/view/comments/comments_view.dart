import 'package:fingerfunke_app/view/comments/widgets/comment_editor.dart';
import 'package:fingerfunke_app/view/comments/widgets/comments_list.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({Key? key}) : super(key: key);

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
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 10), child: CommentsList()),
        const Padding(padding: EdgeInsets.only(top: 10), child: CommentEditor())
      ],
    );
  }
}
