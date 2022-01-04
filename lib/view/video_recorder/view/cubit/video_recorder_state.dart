part of 'video_recorder_cubit.dart';

@freezed
class VideoRecorderState with _$VideoRecorderState {
  const factory VideoRecorderState.initial() = _Initial;
  const factory VideoRecorderState.preparing() = _Preparing;
  const factory VideoRecorderState.recording(
      CameraController controller, UnixMs startTime) = _Recording;
  const factory VideoRecorderState.saving() = _Saving;
  const factory VideoRecorderState.viewing(String filepath) = _Viewing;
  const factory VideoRecorderState.sending(String filepath) = _Sending;
  const factory VideoRecorderState.error(String msg) = _Error;
}
