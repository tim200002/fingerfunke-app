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
  /// generic error state. Might need to be differentiated into multiple
  /// specific states
  const factory VideoRecorderState.error(dynamic err) = _Error;

  /// state that handles the previewing of camera footage
  const factory VideoRecorderState.camera() = _Camera;

  /// state that allows the viewing of the recorded video
  const factory VideoRecorderState.viewing(File file) = _Viewing;
}
