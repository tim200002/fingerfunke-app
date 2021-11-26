import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/fullscreen_video/view/fullscreen_video_page.dart';
import 'package:flutter/material.dart';

class VideoComment extends StatelessWidget {
  const VideoComment({Key? key}) : super(key: key);

  static const double _commentPadding = 8;
  static const double _commentHeight = 120;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(FullscreenVideoPage.route(
          url: "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4")),
      child: SizedBox(
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
        ),
      ),
    );
  }
}
