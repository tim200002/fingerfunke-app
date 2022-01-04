part of 'video_recorder_cubit.dart';

@freezed
class VideoRecorderState with _$VideoRecorderState {
  const factory VideoRecorderState.loading() = _Loading;
  const factory VideoRecorderState.error(String msg) = _Error;

  const factory VideoRecorderState.previewing(CameraController controller) =
      _Previewing;
  const factory VideoRecorderState.recording(
      CameraController controller, UnixMs startTime) = _Recording;

  const factory VideoRecorderState.viewing(
      String filepath, VideoPlayerController videoController) = _Viewing;

  //for simplicity these states are covered by 'loading' for now
  //const factory VideoRecorderState.saving() = _Saving;
  //const factory VideoRecorderState.sending(String filepath) = _Sending;

}
