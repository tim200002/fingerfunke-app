import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:video_player/video_player.dart';

/// Widget to consume the `Viewing` state of the `VideoRecorderCubit`.
/// Allows the user to view, and then submit or reject the video that was
/// recorded
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
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.read<VideoRecorderCubit>().openCamera(),
          ),
          title: const Text('Preview'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.send_rounded),
            onPressed: () => context
                .read<VideoRecorderCubit>()
                .submitRecording(videoController, filePath)),
        extendBodyBehindAppBar: true,
        body: VideoPlayer(videoController));
  }
}
