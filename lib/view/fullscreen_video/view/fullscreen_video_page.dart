import 'package:fingerfunke_app/common_widgets/video/video_playback_cubit/video_playback_cubit.dart';
import 'package:fingerfunke_app/common_widgets/video/view/video_paused_indicator.dart';
import 'package:fingerfunke_app/common_widgets/video/view/video_playback_view.dart';
import 'package:fingerfunke_app/common_widgets/video/view/video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullscreenVideoPage extends StatelessWidget {
  const FullscreenVideoPage({required this.url, Key? key}) : super(key: key);

  final String url;

  static Route route({required String url}) {
    return MaterialPageRoute<void>(
      builder: (_) => FullscreenVideoPage(
        url: url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        extendBody: false,
        extendBodyBehindAppBar: true,
        body: BlocProvider(
          create: (context) =>
              VideoPlaybackCubit(url: url, autoplay: true, loop: true),
          child: Stack(
            children: [
              Builder(builder: (context) {
                return GestureDetector(
                    onTap: () => BlocProvider.of<VideoPlaybackCubit>(context)
                        .togglePlay(),
                    child: const VideoPlaybackView());
              }),
              const Align(
                alignment: Alignment.topCenter,
                child: VideoProgressBar(),
              ),
              const Align(
                alignment: Alignment.center,
                child: VideoPausedIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
