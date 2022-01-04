import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/previewing_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/recording_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/viewing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/loading_view.dart';

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
        child: Scaffold(
            body: BlocBuilder<VideoRecorderCubit, VideoRecorderState>(
                builder: (context, state) => state.when(
                    loading: () => const LoadingView(),
                    error: (msg) => DevTools.placeholder("use error widget"),
                    previewing: (controller) =>
                        PreviewingView(controller: controller),
                    recording: (controller, time) =>
                        RecordingView(startTime: time, controller: controller),
                    viewing: (path, videoController) => ViewingView(
                        filePath: path, videoController: videoController)))));
  }
}
