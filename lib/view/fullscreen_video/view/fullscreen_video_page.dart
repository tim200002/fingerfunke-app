import 'package:flutter/material.dart';

import '../../../common_widgets/video/view/video_playback_view.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.white,
        ),
        extendBody: false,
        extendBodyBehindAppBar: true,
        body: VideoPlaybackView.simple(
          source: url,
          sourceType: VideoSourceType.network,
          fit: BoxFit.cover,
          controls: true,
        ),
      ),
    );
  }
}
