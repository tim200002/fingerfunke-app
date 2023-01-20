import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

import '../video_playback_cubit/video_playback_cubit.dart';
import 'video_paused_indicator.dart';

enum VideoSourceType {
  network(VideoPlayerController.network),
  asset(VideoPlayerController.asset);

  const VideoSourceType(this.toController);

  final VideoPlayerController Function(String source) toController;
}

class VideoPlaybackView extends StatelessWidget {
  final BoxFit fit;
  final BorderRadius borderRadius;
  final Widget? thumbnail;
  final bool controls;
  final bool showProgressBar;

  static Widget simple(
      {required String source,
      required VideoSourceType sourceType,
      bool loop = true,
      bool autoplay = true,
      BoxFit fit = BoxFit.contain,
      Widget? thumbnail,
      bool controls = false,
      bool showProgressBar = false,
      BorderRadius borderRadius = BorderRadius.zero}) {
    return BlocProvider(
      create: (context) => VideoPlaybackCubit(
          controller: sourceType.toController.call(source),
          autoplay: autoplay,
          loop: loop),
      child: VideoPlaybackView(
          fit: fit,
          thumbnail: thumbnail,
          controls: controls,
          showProgressBar: showProgressBar,
          borderRadius: borderRadius),
    );
  }

  const VideoPlaybackView(
      {Key? key,
      this.fit = BoxFit.contain,
      this.thumbnail,
      this.controls = false,
      this.showProgressBar = false,
      this.borderRadius = BorderRadius.zero})
      : super(key: key);

  Widget _videoPlayer(
      BuildContext context, VideoPlayerController controller, bool playing) {
    return ClipRRect(
        borderRadius: borderRadius,
        child: Stack(children: [
          SizedBox.expand(
              child: FittedBox(
            fit: fit,
            child: SizedBox(
                width: controller.value.size.width,
                height: controller.value.size.height,
                child: VideoPlayer(controller)),
          )),
          if (showProgressBar)
            Align(
              alignment: Alignment.bottomCenter,
              child: VideoProgressIndicator(
                controller,
                colors: VideoProgressColors(
                    backgroundColor: Colors.transparent,
                    playedColor: Theme.of(context).colorScheme.primary),
                allowScrubbing: false,
              ),
            ),
          if (controls) const Center(child: VideoPausedIndicator()),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlaybackCubit, VideoPlaybackState>(
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: state.when(
            initializing: () =>
                thumbnail ?? const Center(child: CircularProgressIndicator()),
            playing: (c, p) => controls
                ? InkWell(
                    child: _videoPlayer(context, c, p),
                    onTap: () {
                      context.read<VideoPlaybackCubit>().togglePlay();
                    })
                : _videoPlayer(context, c, p),
            error: (error) =>
                const Center(child: Icon(FeatherIcons.alertCircle))),
      ),
    );
  }
}
