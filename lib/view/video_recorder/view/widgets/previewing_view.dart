import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class PreviewingView extends StatelessWidget {
  final CameraController controller;
  const PreviewingView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_rounded),
          onPressed: () =>
              context.read<VideoRecorderCubit>().startRecording(controller),
        ),
        body: VideoRecorderPage.fullScreenCameraPreview(
            MediaQuery.of(context).size.aspectRatio, controller));
  }
}
