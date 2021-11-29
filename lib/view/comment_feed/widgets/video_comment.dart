import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/comment_feed/comment_feed.dart';
import 'package:fingerfunke_app/view/fullscreen_video/view/fullscreen_video_page.dart';
import 'package:flutter/material.dart';

class VideoComment extends StatelessWidget {
  final VideoMessage message;
  const VideoComment(this.message, {Key? key}) : super(key: key);

  static const double _commentPadding = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(FullscreenVideoPage.route(url: message.video)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: CommentFeed.commentHeight,
            child: Stack(
              children: [
                DevTools.placeholder("Video Comment", dark: true),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(_commentPadding),
                    child: AuthorInfo(
                      message.author,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
