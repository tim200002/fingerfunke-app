import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ViewingView extends StatelessWidget {
  final String filePath;
  final VideoPlayerController videoController;
  const ViewingView(
      {Key? key, required this.videoController, required this.filePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Preview'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send_rounded),
          onPressed: () =>
              DevTools.showToDoSnackbar(context, message: "upload video"),
        ),
        extendBodyBehindAppBar: true,
        body: VideoPlayer(videoController));
  }
}
