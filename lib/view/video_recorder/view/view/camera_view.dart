import 'package:camera/camera.dart';
import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/loading_view.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/new_record_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'dart:math';

class CameraView extends StatefulWidget {
  CameraView({Key? key}) : super(key: key);

  final Logger _logger = Logger();

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  late final List<CameraDescription> _cameras;
  int _currentCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras.isEmpty) {
      throw Exception("There is no available camera");
    }
    int cameraIndex = _cameras
        .indexWhere((c) => c.lensDirection == CameraLensDirection.front);
    if (cameraIndex == -1) {
      widget._logger.i(
          "There is no front camera available, fallign back to availabe camera");
      _currentCameraIndex = 0;
    }

    _controller = CameraController(
        _cameras[_currentCameraIndex], ResolutionPreset.max,
        enableAudio: false);
    await _controller!.initialize();
    setState(() {
      _currentCameraIndex = cameraIndex;
    });
  }

  Future<void> _startRecording() async {
    _controller!.startVideoRecording();
  }

  Future<XFile> _stopRecording() async {
    final file = await _controller!.stopVideoRecording();
    return file;
  }

  Future<void> _toggleFlash() async {
    await _controller?.setFlashMode(
        _controller!.value.flashMode == FlashMode.off
            ? FlashMode.torch
            : FlashMode.off);

    setState(() {});
  }

  Future<void> _toggleCamera() async {
    await _controller?.dispose();
    setState(() {
      _controller = null;
    });
    final int newCameraDirection =
        (_currentCameraIndex + 1) % min(_cameras.length, 2);
    _controller = CameraController(
        _cameras[newCameraDirection], ResolutionPreset.max,
        enableAudio: false);

    _controller!.initialize().then((value) => setState(() {}));
  }

  Widget _fullScreenCameraPreview(
      BuildContext context, CameraController controller) {
    final scale =
        MediaQuery.of(context).size.aspectRatio * controller.value.aspectRatio;

    return Transform.scale(
      scale: scale < 1 ? 1 / scale : scale,
      child: Center(
        child: CameraPreview(controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _controller?.value.isInitialized == true
        ? Scaffold(
            appBar: AppBar(
              actions: _controller!.value.isRecordingVideo == false
                  ? [
                      /*
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
                          */
                      IconButton(
                          onPressed: () => _toggleFlash(),
                          icon: _controller!.value.flashMode == FlashMode.torch
                              ? const Icon(Icons.flash_on_rounded)
                              : const Icon(Icons.flash_off_rounded)),
                      IconButton(
                          onPressed: () => _toggleCamera(),
                          icon: _currentCameraIndex == 1
                              ? const Icon(Icons.camera_front_rounded)
                              : const Icon(Icons.camera_rear_rounded))
                    ]
                  : null,
            ),
            extendBodyBehindAppBar: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: NewRecordButton(
              maxRecodingLength: 10,
              onRecordingStarted: () => _startRecording(),
              onRecordingFinished: () async {
                final file = await _stopRecording();
                BlocProvider.of<VideoRecorderCubit>(context)
                    .onRecordingFinished(file);
              },
            ),
            body: Center(
              child: _fullScreenCameraPreview(context, _controller!),
            ),
          )
        : const LoadingView();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
