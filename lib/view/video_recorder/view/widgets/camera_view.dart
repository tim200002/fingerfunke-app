import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/record_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

/// Widget to consume the `Previewing` state of the `VideoRecorderCubit`.
/// Shows the current capture of the selected camera and allows the user to
/// change different parameters for the camera.
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
        floatingActionButton: RecordButton.startButton(
          onPressed: () =>
              context.read<VideoRecorderCubit>().startRecording(controller),
        ),
        body: VideoRecorderPage.fullScreenCameraPreview(
            MediaQuery.of(context).size.aspectRatio, controller));
  }
}
