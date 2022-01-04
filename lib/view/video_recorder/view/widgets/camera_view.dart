import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CameraView extends StatelessWidget {
  final CameraController controller;
  final CameraSettings settings;
  const CameraView({Key? key, required this.controller, required this.settings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context
                      .read<VideoRecorderCubit>()
                      .toggleTimer(controller, settings);
                  DevTools.showToDoSnackbar(context);
                },
                icon: settings.timer
                    ? const Icon(Icons.timer_3_rounded)
                    : const Icon(Icons.timer_off_rounded)),
            IconButton(
                onPressed: () => context
                    .read<VideoRecorderCubit>()
                    .toggleFlash(controller, settings),
                icon: settings.flash
                    ? const Icon(Icons.flash_on_rounded)
                    : const Icon(Icons.flash_off_rounded)),
            IconButton(
                onPressed: () => context
                    .read<VideoRecorderCubit>()
                    .toggleCamera(controller, settings),
                icon: settings.frontCamera
                    ? const Icon(Icons.camera_front_rounded)
                    : const Icon(Icons.camera_rear_rounded))
          ],
        ),
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
