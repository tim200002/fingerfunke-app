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
    _prepareCamera();
  }

  void startRecording(CameraController controller) async {
    await controller.startVideoRecording();
    emit(VideoRecorderState.recording(
        controller, DateTime.now().millisecondsSinceEpoch));
  }

  void stopRecording(CameraController controller) async {
    try {
      final file = await controller.stopVideoRecording();
      final videoPlayerController = VideoPlayerController.file(File(file.path));
      await videoPlayerController.initialize();
      await videoPlayerController.setLooping(true);
      await videoPlayerController.play();
      emit(VideoRecorderState.viewing(file.path, videoPlayerController));
    } catch (e) {
      emit(VideoRecorderState.error("$e"));
    }
  }

  void _prepareCamera() async {
    try {
      final cameras = await availableCameras();
      final mainCam = cameras
          .firstWhere((c) => c.lensDirection == CameraLensDirection.front);
      final _cameraController = CameraController(mainCam, ResolutionPreset.max);
      await _cameraController.initialize();
      await _cameraController.prepareForVideoRecording();
      emit(VideoRecorderState.previewing(_cameraController));
    } catch (e) {
      emit(VideoRecorderState.error("$e"));
    }
  }
}
