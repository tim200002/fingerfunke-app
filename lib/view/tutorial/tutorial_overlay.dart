import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

import '../../common_widgets/video/view/video_playback_view.dart';
import '../../utils/tools.dart';
import '../../utils/util_widgets/floating_modal.dart';
import 'tutorial_page.dart';

class TutorialOverlay extends StatelessWidget {
  const TutorialOverlay({super.key});

  static void asBottomSheet(BuildContext context) {
    showFloatingModalBottomSheet(
        context: context, builder: (context) => const TutorialOverlay());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n(context).lbl_tutorial,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(FeatherIcons.x))
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(10),
              height: 200.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => const TutorialPage())),
                      child: Stack(
                        children: [
                          VideoPlaybackView.simple(
                              autoplay: false,
                              source: TutorialPage.tutorialPath,
                              sourceType: VideoSourceType.asset,
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(20),
                              controls: false),
                          const Center(
                              child: Icon(Icons.play_arrow_rounded,
                                  color: Colors.white, size: 60))
                        ],
                      ))))
        ],
      ),
    );
  }
}
