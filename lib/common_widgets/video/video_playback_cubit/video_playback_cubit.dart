import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/tools.dart';
import '../../../utils/type_aliases.dart';

part 'video_playback_cubit.freezed.dart';
part 'video_playback_state.dart';

class VideoPlaybackCubit extends Cubit<VideoPlaybackState> {
  VideoPlaybackCubit.file(
      {required File file, bool autoplay = true, bool loop = true})
      : this(
            controller: VideoPlayerController.file(file),
            autoplay: autoplay,
            loop: loop);

  VideoPlaybackCubit.network(
      {required Link url, bool autoplay = true, bool loop = true})
      : this(
            controller: VideoPlayerController.network(url),
            autoplay: autoplay,
            loop: loop);

  VideoPlaybackCubit.asset(
      {required String path, bool autoplay = true, bool loop = true})
      : this(
            controller: VideoPlayerController.asset(path),
            autoplay: autoplay,
            loop: loop);

  VideoPlaybackCubit(
      {required final VideoPlayerController controller,
      bool autoplay = true,
      bool loop = true})
      : super(const VideoPlaybackState.initializing()) {
    controller.initialize().then((_) {
      if (isClosed) return;
      
      // We are an App for people with hearing disabilities
      // any sound in video does not make sense
      controller.setVolume(0);

      if (autoplay) {
        controller.play();
      }
      if (loop) {
        controller.setLooping(true);
      }

      emit(
        VideoPlaybackState.playing(controller, autoplay),
      );
    }).catchError((error, stackTrace) {
      logger.e("error when creating video playback cubit", error, stackTrace);
      if (!isClosed) emit(VideoPlaybackState.error(error));
    });
  }

  void togglePlay() {
    state.mapOrNull(playing: (specificState) async {
      specificState.videoPlayerController.value.isPlaying
          ? await specificState.videoPlayerController.pause()
          : await specificState.videoPlayerController.play();
      emit(specificState.copyWith(
          isPlaying: specificState.videoPlayerController.value.isPlaying));
    });
  }

  @override
  Future<void> close() {
    state.whenOrNull(playing: (controller, _) => controller.dispose());
    return super.close();
  }
}
