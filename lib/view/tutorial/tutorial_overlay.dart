import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

import '../../utils/tools.dart';
import '../../utils/util_widgets/floating_modal.dart';
import 'tutorial_page.dart';

class TutorialOverlay extends StatefulWidget {
  const TutorialOverlay({super.key});

  static void asBottomSheet(BuildContext context) {
    showFloatingModalBottomSheet(
        context: context, builder: (context) => const TutorialOverlay());
  }

  @override
  State<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends State<TutorialOverlay> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(TutorialPage.tutorialPath);
    _controller.initialize().then((_) => setState(() {}),
        onError: (e) => logger.d("Error loading tutorial video", e));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
                  child: TutorialPage.player(
                      controller: _controller,
                      onClick: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => const TutorialPage())))))
        ],
      ),
    );
  }
}
