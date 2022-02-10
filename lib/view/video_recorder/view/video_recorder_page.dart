import 'dart:io';

import 'package:fingerfunke_app/view/error/exception_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/view/camera_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/view/missing_camera_permission_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/view/playback_view.dart';

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

  /*
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
   */

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
            body: BlocBuilder<VideoRecorderCubit, VideoRecorderState>(
              builder: (context, state) => state.when(
                missingPermission: () => const MissingCameraPermissionView(),
                error: ExceptionView.builder,
                camera: () => CameraView(),
                viewing: (file) => PlaybackView(file),
              ),
            ),
          ),
        ));
  }
}
