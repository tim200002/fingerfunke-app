import '../video_playback_cubit/video_playback_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoProgressBar extends StatelessWidget {
  const VideoProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlaybackCubit, VideoPlaybackState>(
      builder: (context, state) => state.when(
          initializing: () => Container(),
          playing: (controller, _) => VideoProgressIndicator(
                controller,
                allowScrubbing: false,
                padding: const EdgeInsets.all(0),
              ),
          error: (_) => Container()),
    );
  }
}
