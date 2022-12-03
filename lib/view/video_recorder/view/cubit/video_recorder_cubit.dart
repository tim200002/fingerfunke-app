import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/logger.dart';

part 'video_recorder_cubit.freezed.dart';
part 'video_recorder_state.dart';

// tuple for camera related information
class Kamera {
  final List<CameraDescription> cameras;
  final CameraDescription description;
  final CameraController controller;

  late final FlashMode flashMode;
  late final bool recording;

  Kamera(this.cameras, this.description, this.controller) {
    flashMode = controller.value.flashMode;
    recording = controller.value.isRecordingVideo;
  }

  factory Kamera.copy(Kamera k) =>
      Kamera(k.cameras, k.description, k.controller);

  @override
  int get hashCode =>
      cameras.hashCode +
      description.hashCode +
      controller.hashCode +
      flashMode.hashCode +
      recording.hashCode;

  @override
  bool operator ==(final Object other) => other.hashCode == hashCode;
}

/// Cubit for recording video with the accompaniing editor. Allows the
/// seamless transition between previewing, recording and viewing the result
/// while handling the management of resources and memory
class VideoRecorderCubit extends Cubit<VideoRecorderState> {
  final maxRecordingsSec = 60;

  VideoRecorderCubit() : super(const VideoRecorderState.loading()) {
    reload();
  }

  void reload() {
    _dispose();
    emit(const VideoRecorderState.loading());
    _initCamera().then((kamera) => emit(VideoRecorderState.camera(kamera)),
        onError: (e) => emit(
            (e is CameraException && e.code == "cameraPermission")
                ? const VideoRecorderState.missingPermission()
                : VideoRecorderState.error(e)));
  }

  Future<Kamera> _initCamera() async {
    var cameras = await availableCameras();
    if (cameras.isEmpty) throw Exception("There is no available camera");

    return await _setCameraDirection(cameras, CameraLensDirection.front);
  }

  Future<Kamera> _setCameraDirection(
      List<CameraDescription> cameras, CameraLensDirection direction,
      [CameraController? oldController]) async {
    final CameraDescription description =
        _getCameraDescriptionFromDirection(cameras, direction);

    final CameraController controller = CameraController(
        description, ResolutionPreset.medium,
        enableAudio: false);

    await oldController?.dispose();

    await controller.initialize();
    return Kamera(cameras, description, controller);
  }

  CameraDescription _getCameraDescriptionFromDirection(
      List<CameraDescription> cameras, CameraLensDirection direction) {
    int cameraIndex = cameras.indexWhere((c) => c.lensDirection == direction);
    if (cameraIndex == -1) {
      getLogger().i("There is no $direction camera available."
          "Falling back to default camera (index 0)");
      return cameras[0];
    }
    return cameras[cameraIndex];
  }

  void onCameraPermissionDenied() {
    emit(const VideoRecorderState.missingPermission());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    emit(VideoRecorderState.error(error));
    super.onError(error, stackTrace);
  }

  Future<void> startRecording() async {
    state.whenOrNull(camera: (c) async {
      await c.controller.startVideoRecording();
      _emitCamera(c);
    });
  }

  Future<void> stopRecording() async {
    state.whenOrNull(camera: (c) async {
      final file = await c.controller.stopVideoRecording();
      emit(VideoRecorderState.viewing(File(file.path)));
    });
  }

  Future<void> toggleFlash() async {
    state.whenOrNull(camera: (c) async {
      await c.controller.setFlashMode(
          c.controller.value.flashMode != FlashMode.torch
              ? FlashMode.torch
              : FlashMode.off);
      _emitCamera(c);
    });
  }

  Future<void> toggleCamera() async {
    state.whenOrNull(camera: (c) async {
      emit(const VideoRecorderState.loading());
      var cam = await _setCameraDirection(
          c.cameras,
          c.description.lensDirection == CameraLensDirection.back
              ? CameraLensDirection.front
              : CameraLensDirection.back,
          c.controller);
      _emitCamera(cam);
    });
  }

  void _emitCamera(Kamera k) {
    var kn = Kamera.copy(k);
    emit(VideoRecorderState.camera(kn));
  }

  Future<void> _dispose() async =>
      state.whenOrNull(camera: (c) => c.controller.dispose());

  @override
  Future<void> close() {
    _dispose();
    return super.close();
  }
}
