import 'package:flutter/material.dart';

import '../../common_widgets/video/view/video_playback_view.dart';
import '../../utils/tools.dart';

class TutorialPage extends StatelessWidget {
  static const String tutorialPath = "https://stream.mux.com/hEOg81IvpDTxjrrdO01RBROjDd1EKzKMOslU7Btj6ntg.m3u8";
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
            sourceType: VideoSourceType.network,
            showProgressBar: true,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(20),
            controls: true,
          ),
        ));
  }
}
