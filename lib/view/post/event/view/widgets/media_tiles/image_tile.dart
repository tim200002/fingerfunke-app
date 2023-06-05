import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../common_widgets/image/fullscreen_image_page/fullscreen_image_page.dart';
import 'media_tile.dart';

class ImageTile extends StatelessWidget {
  final String downloadUrl;
  const ImageTile({required this.downloadUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return MediaTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FullscreenImagePage(downloadUrl))),
      // image with rounded corners
      backgroundImage: CachedNetworkImageProvider(downloadUrl),
    );
  }
}
