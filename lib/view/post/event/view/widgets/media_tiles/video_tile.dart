
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../models/asset/asset.dart';
import '../../../../../../repositories/video_repository/video_repository.dart';
import '../../../../../fullscreen_video/view/fullscreen_video_page.dart';
import 'media_tile.dart';

class VideoTile extends StatelessWidget {
  final VideoAsset videoAsset;
  final VideoRepository _videoRepository = GetIt.I<VideoRepository>();
  VideoTile({required this.videoAsset, super.key});

  @override
  Widget build(BuildContext context) {
    // ToDO Make use of base64 thumbnail data
    String downloadUrl = _videoRepository.createThumbnailUrl(videoAsset);
    String playbackUrl = _videoRepository.createPlaybackUrl(videoAsset);
    return MediaTile(
      onTap: () {
        Navigator.of(context).push(FullscreenVideoPage.route(url: playbackUrl));
      },
      backgroundImage: CachedNetworkImageProvider(downloadUrl),
      child: const Center(
        child: Icon(
          Icons.play_circle_fill,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
