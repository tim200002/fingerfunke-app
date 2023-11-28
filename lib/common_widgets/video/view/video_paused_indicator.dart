import '../video_playback_cubit/video_playback_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPausedIndicator extends StatelessWidget {
  const VideoPausedIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlaybackCubit, VideoPlaybackState>(
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: state.when(
            initializing: () => Container(),
            playing: (controller, _) => controller.value.isPlaying
                ? Container()
                : const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 80,
                  ),
            error: (_) => Container()),
      ),
    );
  }
}
