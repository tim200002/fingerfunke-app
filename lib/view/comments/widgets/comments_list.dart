import 'package:fingerfunke_app/view/comments/widgets/comment_item.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < 7; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: CommentItem(
              commentText: "Kommentar$i",
              isVideo: i % 3 == 0,
            ),
          )
      ],
    );
  }
}
