import 'package:flutter/material.dart';

import '../../common_widgets/video/view/video_playback_view.dart';
import '../../utils/tools.dart';

class TutorialPage extends StatelessWidget {
  static const String tutorialPath = "assets/vid/tutorial_placeholder.mp4";
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(l10n(context).lbl_tutorial),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: VideoPlaybackView.simple(
            source: TutorialPage.tutorialPath,
            sourceType: VideoSourceType.asset,
            showProgressBar: true,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(20),
            controls: true,
          ),
        ));
  }
}
