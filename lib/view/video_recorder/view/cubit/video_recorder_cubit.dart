import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:video_player/video_player.dart';

part 'video_recorder_state.dart';
part 'video_recorder_cubit.freezed.dart';

class VideoRecorderCubit extends Cubit<VideoRecorderState> {
  VideoRecorderCubit() : super(const VideoRecorderState.loading()) {
    openCamera();
  }

  void openCamera() {
    _emitLoading();
    final settings = CameraSettings();
    _prepareCamera(settings).then(
        (controller) => emit(VideoRecorderState.camera(controller, settings)),
        onError: (err) => _emitError);
  }

  void toggleTimer(CameraController controller, CameraSettings settings) {
    settings = settings.copyWith(timer: !settings.timer);
    //controller..setFlashMode(settings.flash ? FlashMode.torch : FlashMode.off);
    emit(VideoRecorderState.camera(controller, settings));
  }

  void toggleFlash(CameraController controller, CameraSettings settings) {
    settings = settings.copyWith(flash: !settings.flash);
    controller.setFlashMode(settings.flash ? FlashMode.torch : FlashMode.off);
    emit(VideoRecorderState.camera(controller, settings));
  }

  void toggleCamera(CameraController controller, CameraSettings settings) {
    settings = settings.copyWith(frontCamera: !settings.frontCamera);
    _prepareCamera(settings).then(
        (controller) => emit(VideoRecorderState.camera(controller, settings)),
        onError: (err) => _emitError);
  }

  void startRecording(CameraController controller) {
    //We might have to discuss whether to add a 'loading transition'.
    //in my opinion the 'lag' is short enough to not require it
    //_emitLoading();
    _prepareRecording(controller).then(
        (time) => emit(VideoRecorderState.recording(controller, time)),
        onError: _emitError);
  }

  void stopRecording(CameraController controller) {
    _emitLoading();
    _finishRecording(controller).then(
        (path) => _preparePlayback(path).then(
            (videoController) =>
                emit(VideoRecorderState.viewing(path, videoController)),
            onError: _emitError),
        onError: _emitError);
  }

  /// helper function to emit an error state with less code
  void _emitError(dynamic error) => emit(VideoRecorderState.error(error));

  /// helper function to emit a loading state with less code
  void _emitLoading() => emit(const VideoRecorderState.loading());

  Future<UnixMs> _prepareRecording(CameraController controller) async {
    await controller.startVideoRecording();
    return DateTime.now().millisecondsSinceEpoch;
  }

  Future<String> _finishRecording(CameraController controller) async {
    final file = await controller.stopVideoRecording();
    controller.dispose();
    return file.path;
  }

  Future<VideoPlayerController> _preparePlayback(String filePath) async {
    final videoPlayerController = VideoPlayerController.file(File(filePath));
    await videoPlayerController.initialize();
    await videoPlayerController.setLooping(true);
    await videoPlayerController.play();
    return videoPlayerController;
  }

  Future<CameraController> _prepareCamera(CameraSettings settings) async {
    final cameras = await availableCameras();
    final mainCam = cameras.firstWhere((c) =>
        c.lensDirection ==
        (settings.frontCamera
            ? CameraLensDirection.front
            : CameraLensDirection.back));
    final _cameraController =
        CameraController(mainCam, ResolutionPreset.max, enableAudio: false);
    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();
    return _cameraController;
  }
}
