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
    _prepareCamera().then(
        (controller) => emit(VideoRecorderState.previewing(controller)),
        onError: (err) => _emitError);
  }

  void startRecording(CameraController controller) {
    _prepareRecording(controller).then(
        (time) => emit(VideoRecorderState.recording(controller, time)),
        onError: _emitError);
  }

  void stopRecording(CameraController controller) {
    _finishRecording(controller).then(
        (path) => _preparePlayback(path).then(
            (videoController) =>
                emit(VideoRecorderState.viewing(path, videoController)),
            onError: _emitError),
        onError: _emitError);
  }

  /// helper function to emit an error state with less code
  void _emitError(dynamic error) => emit(VideoRecorderState.error(error));

  Future<UnixMs> _prepareRecording(CameraController controller) async {
    await controller.startVideoRecording();
    return DateTime.now().millisecondsSinceEpoch;
  }

  Future<String> _finishRecording(CameraController controller) async {
    final file = await controller.stopVideoRecording();
    return file.path;
  }

  Future<VideoPlayerController> _preparePlayback(String filePath) async {
    final videoPlayerController = VideoPlayerController.file(File(filePath));
    await videoPlayerController.initialize();
    await videoPlayerController.setLooping(true);
    await videoPlayerController.play();
    return videoPlayerController;
  }

  Future<CameraController> _prepareCamera() async {
    final cameras = await availableCameras();
    final mainCam =
        cameras.firstWhere((c) => c.lensDirection == CameraLensDirection.front);
    final _cameraController = CameraController(mainCam, ResolutionPreset.max);
    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();
    return _cameraController;
  }
}
