import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/error/exception_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/camera_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/recording_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/viewing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/loading_view.dart';

/// This is the UI for recording video content within the App. The result will
/// be passed back through the Navigator as a `File` object.
/// The Widget allows the user to record, and then view a custom video
class VideoRecorderPage extends StatelessWidget {
  static const videoHeroTag = "video_recorder_video";

  const VideoRecorderPage({Key? key}) : super(key: key);

  static Route<File?> route({Key? key}) {
    return MaterialPageRoute(
        builder: (_) => VideoRecorderPage(key: key),
        settings: const RouteSettings(name: "VideoEditor"));
  }

  static Widget fullScreenCameraPreview(
      double aspectRatio, CameraController controller) {
    var scale = aspectRatio * controller.value.aspectRatio;

    return Transform.scale(
      scale: scale < 1 ? 1 / scale : scale,
      child: Center(
        child: CameraPreview(controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoRecorderCubit>(
        create: (context) => VideoRecorderCubit(),
        child: Theme(
          data: Theme.of(context).copyWith(
              appBarTheme: Theme.of(context)
                  .appBarTheme
                  .copyWith(foregroundColor: Colors.white)),
          child: Scaffold(
              body: BlocConsumer<VideoRecorderCubit, VideoRecorderState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      submitted: (path) =>
                          Navigator.of(context).pop(File(path)),
                    );
                  },
                  builder: (context, state) => state.when(
                      loading: () => const LoadingView(),
                      error: ExceptionView.builder,
                      submitted: (msg) =>
                          DevTools.placeholder("this should not be reachable"),
                      camera: (controller, settings) => CameraView(
                          controller: controller, settings: settings),
                      recording: (controller, time) => RecordingView(
                          startTime: time, controller: controller),
                      viewing: (path, videoController) => ViewingView(
                          filePath: path, videoController: videoController)))),
        ));
  }
}
