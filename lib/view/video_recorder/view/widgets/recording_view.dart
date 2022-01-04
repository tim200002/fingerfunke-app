import 'package:camera/camera.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/record_button.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:provider/src/provider.dart';

const videoLenghSec = 10;

class RecordingView extends StatelessWidget {
  final CameraController controller;
  final UnixMs startTime;
  const RecordingView(
      {Key? key, required this.startTime, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RecordButton(
          maxSeconds: videoLenghSec,
          onPressed: () =>
              context.read<VideoRecorderCubit>().stopRecording(controller),
        ),
        body: VideoRecorderPage.fullScreenCameraPreview(
            MediaQuery.of(context).size.aspectRatio, controller));
  }
}
