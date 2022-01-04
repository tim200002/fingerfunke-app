import 'dart:io';

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

  /*Widget _cameraView(BuildContext context) {
    return DevTools.placeholder(
      "Video Recorder",
      color: Colors.teal.shade100,
    );
  }

  Widget _recordButton(BuildContext context) {
    return InkWell(
        onTap: () async {
          DevTools.showToDoSnackbar(context);
         final File video = await Tools.getImageFileFromAssets('vid/mux_test_video.mp4');
         Navigator.of(context).pop(video);

        } ,
        child: Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.camera_rounded,
              color: Colors.white,
            ),),);
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoRecorderCubit>(
        create: (context) => VideoRecorderCubit(),
        child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop())),
            //extendBodyBehindAppBar: true,
            //floatingActionButtonLocation:
            //    FloatingActionButtonLocation.centerFloat,
            //floatingActionButton: _recordButton(context),
            body: BlocBuilder<VideoRecorderCubit, VideoRecorderState>(
                builder: (context, state) => state.when(
                    loading: () => const LoadingView(),
                    error: (msg) => DevTools.placeholder("use error widget"),
                    previewing: (controller) =>
                        PreviewingView(controller: controller),
                    recording: (controller, time) =>
                        RecordingView(startTime: time, controller: controller),
                    viewing: (path) => ViewingView(
                          filePath: path,
                        )))));
  }
}
