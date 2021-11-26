part of 'video_playback_cubit.dart';

@freezed
class VideoPlaybackState with _$VideoPlaybackState {
  const factory VideoPlaybackState.initializing() = _Initializing;
  const factory VideoPlaybackState.playing(
      VideoPlayerController videoPlayerController, bool isPlaying) = _Playing;
  const factory VideoPlaybackState.error(Object? error) = _Error;
}
