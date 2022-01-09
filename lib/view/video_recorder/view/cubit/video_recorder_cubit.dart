import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:video_player/video_player.dart';

part 'video_recorder_state.dart';
part 'video_recorder_cubit.freezed.dart';

/// Cubit for recording video with the accompaniing editor. Allows the
/// seamless transition between previewing, recording and viewing the result
/// while handling the management of resources and memory
class VideoRecorderCubit extends Cubit<VideoRecorderState> {
  VideoRecorderCubit() : super(const VideoRecorderState.loading()) {
    openCamera();
  }

  /// emit `camera` state after preparing the camera controllers.
  /// Interjects the `loading` state
  ///
  /// Emits the `error` state if any exception occurs
  void openCamera() {
    _emitLoading();
    final settings = CameraSettings();
    _prepareCamera(settings).then(
        (controller) => emit(VideoRecorderState.camera(controller, settings)),
        onError: (err) => _emitError);
  }

  /// emit the `camera` state after changing the CameraSettings object
  void toggleTimer(CameraController controller, CameraSettings settings) {
    settings = settings.copyWith(timer: !settings.timer);
    //controller..setFlashMode(settings.flash ? FlashMode.torch : FlashMode.off);
    emit(VideoRecorderState.camera(controller, settings));
  }

  /// emit the `camera` state after changing the CameraSettings object
  void toggleFlash(CameraController controller, CameraSettings settings) {
    settings = settings.copyWith(flash: !settings.flash);
    controller.setFlashMode(settings.flash ? FlashMode.torch : FlashMode.off);
    emit(VideoRecorderState.camera(controller, settings));
  }

  /// emit the `camera` state after changing the CameraSettings object
  void toggleCamera(CameraController controller, CameraSettings settings) {
    settings = settings.copyWith(frontCamera: !settings.frontCamera);
    _prepareCamera(settings).then(
        (controller) => emit(VideoRecorderState.camera(controller, settings)),
        onError: (err) => _emitError);
  }

  /// emit `recording` state after preparing for recording.
  /// Does not utilize the loading state, as this process seems to be
  /// sufficiently fast and no disposing of relevant objects is neccessary
  ///
  /// Emits the `error` state if any exception occurs
  void startRecording(CameraController controller) {
    //We might have to discuss whether to add a 'loading transition'.
    //in my opinion the 'lag' is short enough to not require it
    //_emitLoading();
    _prepareRecording(controller).then(
        (time) => emit(VideoRecorderState.recording(controller, time)),
        onError: _emitError);
  }

  /// emit `viewing` state after finishing and saving the recording to file.
  /// Interjects the `loading` state
  ///
  /// Emits the `error` state if any exception occurs
  void stopRecording(CameraController controller) {
    _emitLoading();
    _finishRecording(controller).then(
        (path) => _preparePlayback(path).then(
            (videoController) =>
                emit(VideoRecorderState.viewing(path, videoController)),
            onError: _emitError),
        onError: _emitError);
  }

  /// emit `camera` state after deleting the recording and disposing the
  /// viewing controllers.
  /// Interjects the `loading` state
  ///
  /// Emits the `error` state if any exception occurs
  void deleteRecording(VideoPlayerController controller, String filePath) {
    _emitLoading();
    controller.dispose().then(
        (_) => _deleteRecording(filePath)
            .then((_) => openCamera(), onError: _emitError),
        onError: _emitError);
  }

  /// emit `submitted` state after disposing viewing controllers.
  ///
  /// Emits the `error` state if any exception occurs
  void submitRecording(VideoPlayerController controller, String filePath) {
    _emitLoading();
    controller.dispose().then(
        (_) => emit(VideoRecorderState.submitted(filePath)),
        onError: _emitError);
  }

  @override
  Future<void> close() {
    state.whenOrNull(
        camera: (controller, _) => controller.dispose(),
        recording: (controller, _) => controller.dispose(),
        viewing: (path, vidController) {
          _deleteRecording(path);
          vidController.dispose();
        });

    return super.close();
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
    await controller.dispose();
    return file.path;
  }

  Future<VideoPlayerController> _preparePlayback(String filePath) async {
    final videoPlayerController = VideoPlayerController.file(File(filePath));
    await videoPlayerController.initialize();
    await videoPlayerController.setLooping(true);
    await videoPlayerController.play();
    return videoPlayerController;
  }

  Future<void> _deleteRecording(String filePath) async {
    await File(filePath).delete();
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
