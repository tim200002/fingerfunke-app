import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:provider/src/provider.dart';

const videoLenghSec = 10;

class RecordingView extends StatefulWidget {
  final CameraController controller;
  final UnixMs startTime;
  const RecordingView(
      {Key? key, required this.startTime, required this.controller})
      : super(key: key);

  @override
  State<RecordingView> createState() => _RecordingViewState();
}

class _RecordingViewState extends State<RecordingView>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: videoLenghSec),
    vsync: this,
  )..forward();

  @override
  void initState() {
    _controller.addStatusListener((status) {
      //force finish recording
      if (status == AnimationStatus.completed) {
        context.read<VideoRecorderCubit>().stopRecording(widget.controller);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget recordingButton(
      {required void Function() onPressed, Color color = Colors.redAccent}) {
    return InkWell(
      onTap: onPressed,
      child: LimitedBox(
        maxHeight: 100,
        maxWidth: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) => SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  color: color,
                  value: _controller.value,
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              //padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(100)),
              child: const Icon(Icons.stop_rounded, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: recordingButton(
          onPressed: () => context
              .read<VideoRecorderCubit>()
              .stopRecording(widget.controller),
        ),
        body: VideoRecorderPage.fullScreenCameraPreview(
            MediaQuery.of(context).size.aspectRatio, widget.controller));
  }
}
