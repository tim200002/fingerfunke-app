import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/utils/logger.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_playback_cubit.freezed.dart';
part 'video_playback_state.dart';

class VideoPlaybackCubit extends Cubit<VideoPlaybackState> {
  VideoPlaybackCubit(
      {required Link url, bool autoplay = true, bool loop = true})
      : super(const VideoPlaybackState.initializing()) {
    final VideoPlayerController controller = VideoPlayerController.network(url);
    controller.initialize().then((_) {
      if (isClosed) return;
      emit(
        VideoPlaybackState.playing(controller, autoplay),
      );
      if (autoplay) {
        controller.play();
      }
      if (loop) {
        controller.setLooping(true);
      }
    }).catchError((error, stackTrace) {
      getLogger().e("error", error, stackTrace);
      if (!isClosed) emit(VideoPlaybackState.error(error));
    });
  }

  void togglePlay() {
    state.mapOrNull(playing: (specificState) async {
      specificState.videoPlayerController.value.isPlaying
          ? await specificState.videoPlayerController.pause()
          : await specificState.videoPlayerController.play();
      emit(specificState.copyWith(
          isPlaying: !specificState.videoPlayerController.value.isPlaying));
    });
  }

  @override
  Future<void> close() {
    state.whenOrNull(playing: (controller, _) => controller.dispose());
    return super.close();
  }
}
