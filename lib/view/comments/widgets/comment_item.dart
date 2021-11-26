import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/comments/widgets/text_comment.dart';
import 'package:fingerfunke_app/view/comments/widgets/video_comment.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  static const double _commentPadding = 8;
  static const double _commentHeight = 120;
  //TODO replace with comment object
  String commentText;
  bool isVideo;
  CommentItem({Key? key, required this.commentText, required this.isVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        //padding: EdgeInsets.all(10),
        color: Colors.grey.shade100,
        constraints: const BoxConstraints(minHeight: _commentHeight),
        child: isVideo ? VideoComment() : TextComment(),
      ),
    );
  }
}
