import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  static const double _commentPadding = 8;
  static const double _commentHeight = 120;
  //TODO replace with comment object
  String commentText;
  bool isVideo;
  CommentItem({Key? key, required this.commentText, required this.isVideo})
      : super(key: key);

  Widget _videoComment(BuildContext context) {
    return SizedBox(
        height: _commentHeight,
        child: Stack(
          children: [
            DevTools.placeholder("Video Comment", dark: true),
            const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(_commentPadding),
                  child: AuthorInfo(
                    UserInfo(id: "test", name: "test"),
                  ),
                ))
          ],
        ));
  }

  Widget _textComment(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(_commentPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(text),
          const AuthorInfo(
            UserInfo(id: "test", name: "test"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            //padding: EdgeInsets.all(10),
            color: Colors.grey.shade100,
            constraints: const BoxConstraints(minHeight: _commentHeight),
            child: isVideo
                ? _videoComment(context)
                : _textComment(context, commentText)));
  }
}
