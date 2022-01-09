part of 'video_recorder_cubit.dart';

class CameraSettings {
  bool frontCamera;
  bool flash;
  bool timer;

  CameraSettings(
      {this.frontCamera = true, this.flash = false, this.timer = false});

  CameraSettings copyWith({bool? frontCamera, bool? flash, bool? timer}) {
    return CameraSettings(
        frontCamera: frontCamera ?? this.frontCamera,
        flash: flash ?? this.flash,
        timer: timer ?? this.timer);
  }
}

@freezed
class VideoRecorderState with _$VideoRecorderState {
  /// generic loading state that is used for showing progress to the user
  const factory VideoRecorderState.loading() = _Loading;

  /// generic error state. Might need to be differentiated into multiple
  /// specific states
  const factory VideoRecorderState.error(dynamic err) = _Error;

  /// state that handles the previewing of camera footage
  const factory VideoRecorderState.camera(
      CameraController controller, CameraSettings cameraSettings) = _Previewing;

  /// state that contains relevant information while recording a video
  const factory VideoRecorderState.recording(
      CameraController controller, UnixMs startTime) = _Recording;

  /// state that allows the viewing of the recorded video
  const factory VideoRecorderState.viewing(
      String filepath, VideoPlayerController videoController) = _Viewing;

  /// state that initiates the closing of the video recorder while passing the
  /// video file to the Navigator
  const factory VideoRecorderState.submitted(String filePath) = _Submitted;
}
