import 'package:fingerfunke_app/common_widgets/video/video_playback_cubit/video_playback_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlaybackView extends StatelessWidget {
  const VideoPlaybackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlaybackCubit, VideoPlaybackState>(
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: state.when(
            initializing: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            playing: (controller, _) => VideoPlayer(controller),
            //!ToDo
            error: (error) => ErrorWidget(error!)),
      ),
    );
  }
}
