import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/exceptions.dart';
import '../cubit/video_recorder_cubit.dart';
import '../widgets/new_record_button.dart';

class CameraView extends StatefulWidget {
  static const Duration countdownLength = Duration(seconds: 3);
  final Kamera camera;
  const CameraView({Key? key, required this.camera}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with TickerProviderStateMixin {
  late final AnimationController _countdownController;

  @override
  void initState() {
    super.initState();
    _countdownController = AnimationController(
      lowerBound: -1.0 * (CameraView.countdownLength.inSeconds),
      upperBound: 0,
      vsync: this,
      duration: CameraView.countdownLength,
    );
    _countdownController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<VideoRecorderCubit>().startRecording();
      }
    });
  }

  void _startCountdown() => setState(() {
        _countdownController.forward();
      });

  Widget _fullScreenCameraPreview(BuildContext context) {
    final scale = MediaQuery.of(context).size.aspectRatio *
        widget.camera.controller.value.aspectRatio;

    return Transform.scale(
      scale: scale < 1 ? 1 / scale : scale,
      child: Center(
        child: CameraPreview(widget.camera.controller),
      ),
    );
  }

  Widget _countdownText(BuildContext context) {
    return AnimatedBuilder(
        animation: _countdownController,
        builder: (BuildContext context, Widget? child) => Text(
            _countdownController.value.abs().ceil().toString(),
            style: const TextStyle(
                fontSize: 140.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                      color: Color(0x99616161),
                      blurRadius: 20,
                      offset: Offset(0, 3))
                ])));
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: !widget.camera.recording
            ? [
                if (widget.camera.description.lensDirection ==
                    CameraLensDirection.back)
                  IconButton(
                    onPressed: context.read<VideoRecorderCubit>().toggleFlash,
                    icon: Icon(widget.camera.flashMode == FlashMode.torch
                        ? Icons.flash_on_rounded
                        : Icons.flash_off_rounded),
                    color: Colors.black,
                  ),
                IconButton(
                  onPressed: context.read<VideoRecorderCubit>().toggleCamera,
                  icon: Icon(widget.camera.description.lensDirection ==
                          CameraLensDirection.front
                      ? Icons.camera_front_rounded
                      : Icons.camera_rear_rounded),
                  color: Colors.black,
                )
              ]
            : null,
      ),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Button to open gallery, only visible when not recording
          BlocBuilder<VideoRecorderCubit, VideoRecorderState>(
              builder: (context, state) => state.maybeWhen(
                    camera: (camera, isRecording) => !isRecording? Expanded(
                      child: FloatingActionButton(
                        onPressed:
                            context.read<VideoRecorderCubit>().openGallery,
                        child: const Icon(Icons.photo_library_rounded),
                      ),
                    ) : const Spacer(),
                    orElse: () => throw InvalidStateException(),
                  )),

          // Button to start/stop recording
          Expanded(
              child: NewRecordButton(
                  isRecording: widget.camera.recording,
                  maxRecodingLength: 60,
                  onStartPressed: _startCountdown,
                  onStopPressed:
                      context.read<VideoRecorderCubit>().stopRecording)),
          // To align on left side
          const Spacer()
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: _fullScreenCameraPreview(context),
          ),
          AnimatedOpacity(
              opacity: _countdownController.isAnimating ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(child: _countdownText(context))))
        ],
      ),
    );
  }
}
