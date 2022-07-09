import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/video/video_playback_cubit/video_playback_cubit.dart';
import '../../../common_widgets/video/view/video_paused_indicator.dart';
import '../../../common_widgets/video/view/video_playback_view.dart';
import '../../../common_widgets/video/view/video_progress_bar.dart';

class FullscreenVideoPage extends StatelessWidget {
  final BoxFit fit;
  const FullscreenVideoPage(
      {required this.url, Key? key, this.fit = BoxFit.contain})
      : super(key: key);

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
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          canvasColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0)),
      child: SafeArea(
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
                      child: VideoPlaybackView(
                          fit: fit,
                          borderRadius: BorderRadius.circular(
                              fit == BoxFit.contain ? 20 : 0)));
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
      ),
    );
  }
}
