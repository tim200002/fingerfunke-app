import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/view/comment_feed/comment_feed.dart';
import 'package:flutter/material.dart';

class TextComment extends StatelessWidget {
  final TextMessage message;
  const TextComment(this.message, {Key? key}) : super(key: key);
  static const double _commentPadding = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          //padding: EdgeInsets.all(10),
          color: Colors.grey.shade100,
          constraints:
              const BoxConstraints(minHeight: CommentFeed.commentHeight),
          child: Padding(
            padding: const EdgeInsets.all(_commentPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(message.text),
                AuthorInfo(message.author),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
