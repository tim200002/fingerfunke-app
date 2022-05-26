import 'package:fingerfunke_app/common_widgets/video/video_playback_cubit/video_playback_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlaybackView extends StatelessWidget {
  final BoxFit fit;
  final BorderRadius borderRadius;
  final Widget? thumbnail;
  const VideoPlaybackView(
      {Key? key,
      this.fit = BoxFit.contain,
      this.thumbnail,
      this.borderRadius = BorderRadius.zero})
      : super(key: key);

  Widget _videoPlayer(
    BuildContext context,
    VideoPlayerController controller,
  ) {
    return SizedBox.expand(
        child: FittedBox(
      fit: fit,
      child: SizedBox(
        width: controller.value.size.width,
        height: controller.value.size.height,
        child: ClipRRect(
            borderRadius: borderRadius, child: VideoPlayer(controller)),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlaybackCubit, VideoPlaybackState>(
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: state.when(
            initializing: () =>
                thumbnail ??
                const Center(
                  child: CircularProgressIndicator(),
                ),
            playing: (controller, _) => _videoPlayer(context, controller),
            error: (error) => ErrorWidget(error)),
      ),
    );
  }
}
