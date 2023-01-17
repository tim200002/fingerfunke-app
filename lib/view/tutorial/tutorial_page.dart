import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../utils/tools.dart';

class TutorialPage extends StatefulWidget {
  static const String tutorialPath = "assets/vid/tutorial_placeholder.mp4";
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();

  static Widget player(
      {required VideoPlayerController controller,
      bool playing = false,
      required void Function() onClick}) {
    return controller.value.isInitialized
        ? InkWell(
            onTap: onClick,
            child: Stack(alignment: Alignment.center, children: [
              OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  alignment: Alignment.center,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 1080,
                          height: 1920,
                          child: VideoPlayer(controller)))),
              if (!playing)
                const Center(
                    child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 80,
                ))
            ]),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class _TutorialPageState extends State<TutorialPage> {
  late VideoPlayerController _controller;
  bool playing = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(TutorialPage.tutorialPath);
    _controller.initialize().then((_) {
      _controller.play();
      setState(() => playing = true);
    }, onError: (e) => logger.d("Error loading tutorial video", e));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(l10n(context).lbl_tutorial),
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TutorialPage.player(
                    controller: _controller,
                    playing: playing,
                    onClick: () {
                      playing ? _controller.pause() : _controller.play();
                      setState(() => playing = !playing);
                    }))));
  }
}
