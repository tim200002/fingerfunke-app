import '../video_playback_cubit/video_playback_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlaybackView extends StatelessWidget {
  final BoxFit fit;
  final BorderRadius borderRadius;
  final Widget? thumbnail;
  final VideoPlayerController? _controller;
  const VideoPlaybackView(
      {Key? key,
      this.fit = BoxFit.contain,
      this.thumbnail,
      this.borderRadius = BorderRadius.zero})
      : _controller = null,
        super(key: key);

  const VideoPlaybackView.controller(
      {Key? key,
      this.fit = BoxFit.contain,
      this.thumbnail,
      required VideoPlayerController controller,
      this.borderRadius = BorderRadius.zero})
      : _controller = controller,
        super(key: key);

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
    return _controller != null
        ? _videoPlayer(context, _controller!)
        : BlocBuilder<VideoPlaybackCubit, VideoPlaybackState>(
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
