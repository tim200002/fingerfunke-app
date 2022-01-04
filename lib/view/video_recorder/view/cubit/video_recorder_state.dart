part of 'video_recorder_cubit.dart';

class CameraSettings {
  bool frontCamera;
  bool flash;
  bool timer;

  CameraSettings(
      {this.frontCamera = false, this.flash = false, this.timer = false});

  CameraSettings copyWith({bool? frontCamera, bool? flash, bool? timer}) {
    return CameraSettings(
        frontCamera: frontCamera ?? this.frontCamera,
        flash: flash ?? this.flash,
        timer: timer ?? this.timer);
  }
}

@freezed
class VideoRecorderState with _$VideoRecorderState {
  const factory VideoRecorderState.loading() = _Loading;
  const factory VideoRecorderState.error(dynamic err) = _Error;

  const factory VideoRecorderState.camera(
      CameraController controller, CameraSettings cameraSettings) = _Previewing;
  const factory VideoRecorderState.recording(
      CameraController controller, UnixMs startTime) = _Recording;

  const factory VideoRecorderState.viewing(
      String filepath, VideoPlayerController videoController) = _Viewing;

  //for simplicity these states are covered by 'loading' for now
  //const factory VideoRecorderState.saving() = _Saving;
  //const factory VideoRecorderState.sending(String filepath) = _Sending;

}
