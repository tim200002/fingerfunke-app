import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../utils/tools.dart';
import '../cubit/video_recorder_cubit.dart';
import '../widgets/new_record_button.dart';

class CameraView extends StatefulWidget {
  CameraView({Key? key}) : super(key: key);

  final Logger _logger = Logger();

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  CameraController? _controller;
  CameraDescription? _camera;
  late final List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    // check if null check is valid, I think yes because ensure intitialized in main
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        throw Exception("There is no available camera");
      }
    } catch (err, stackTrace) {
      return BlocProvider.of<VideoRecorderCubit>(context)
          .onError(err, stackTrace);
    }

    await _setCameraController(CameraLensDirection.front);
  }

  Future<void> _setCameraController(CameraLensDirection direction) async {
    try {
      final CameraDescription tempCamera =
          _getCameraDescriptionFromDirection(direction);

      final CameraController? _oldController = _controller;
      final CameraController newController = CameraController(
          tempCamera, ResolutionPreset.medium,
          enableAudio: false);
      setState(() {
        _camera = tempCamera;
        _controller = newController;
      });

      if (_oldController != null) {
        await _oldController.dispose();
      }

      await newController.initialize();
      setState(() {});
    } on CameraException catch (err) {
      switch (err.code) {
        case "cameraPermission":
          {
            return BlocProvider.of<VideoRecorderCubit>(context)
                .onCameraPermissionDenied();
          }
      }
      rethrow;
    } catch (err, stackTrace) {
      return BlocProvider.of<VideoRecorderCubit>(context)
          .onError(err, stackTrace);
    }
  }

  CameraDescription _getCameraDescriptionFromDirection(
      CameraLensDirection direction) {
    int cameraIndex = _cameras.indexWhere((c) => c.lensDirection == direction);
    if (cameraIndex == -1) {
      if (_camera != null) {
        widget._logger.i(
            "There is no $direction camera available, falling back to last used camera");
        return _camera!;
      } else {
        widget._logger.i(
            "There is no $direction camera available, fallign back to default camera (index 0)");
        return _cameras[0];
      }
    }
    return _cameras[cameraIndex];
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
        _controller!.value.flashMode != FlashMode.torch
            ? FlashMode.torch
            : FlashMode.off);

    setState(() {});
  }

  Future<void> _toggleCamera() async {
    _setCameraController(_camera!.lensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back);
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
                      if (_camera!.lensDirection == CameraLensDirection.back)
                        IconButton(
                            onPressed: () => _toggleFlash(),
                            icon:
                                _controller!.value.flashMode == FlashMode.torch
                                    ? const Icon(Icons.flash_on_rounded)
                                    : const Icon(Icons.flash_off_rounded)),
                      IconButton(
                          onPressed: () => _toggleCamera(),
                          icon: _camera!.lensDirection ==
                                  CameraLensDirection.front
                              ? const Icon(Icons.camera_front_rounded)
                              : const Icon(Icons.camera_rear_rounded))
                    ]
                  : null,
            ),
            extendBodyBehindAppBar: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: NewRecordButton(
              maxRecodingLength: 60,
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
        : Tools.loadingScaffold();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose().then((value) => widget._logger.i("Camera Disposed"));

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller!.dispose().then((_) {
        widget._logger
            .i("App Lifecyle changed to background, realeasing camera");
      });
    } else if (state == AppLifecycleState.resumed) {
      widget._logger.i("App Lifecyle changed to foreground, rebinding camera");
      _setCameraController(_camera!.lensDirection);
    }
  }
}
