import 'package:fingerfunke_app/view/post/event/view/widgets/media_tiles/video_tile.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/asset/asset.dart';
import 'image_tile.dart';
import 'pdf_tile.dart';

class MediaTile extends StatelessWidget {
  static Widget getProperTile(Asset asset) {
    if (asset.type == AssetType.firebaseAsset) {
      FirebaseAsset firebaseAsset = asset as FirebaseAsset;
      String downloadUrl = firebaseAsset.downloadUrl!;
      if (firebaseAsset.mediaType == MediaType.image) {
        return ImageTile(downloadUrl: downloadUrl);
      } else if (firebaseAsset.mediaType == MediaType.pdf) {
        return PdfTile(downloadUrl: downloadUrl);
      }
    }

    if (asset.type == AssetType.video) {
      VideoAsset videoAsset = asset as VideoAsset;
      return VideoTile(videoAsset: videoAsset);
    }
    throw Exception("Asset type not supported");
  }

  final int minSize = 150;
  final int padding = 10;
  final Function onTap;
  final ImageProvider backgroundImage;
  final Widget? child;
  const MediaTile(
      {required this.onTap,
      required this.backgroundImage,
      this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    // calculate size of tile
    final width = MediaQuery.of(context).size.width;
    late final imageSize;
    if (width / 2 > minSize) {
      imageSize = (width / 2) - 4 * padding;
    } else {
      imageSize = width - 2 * padding;
    }

    return Padding(
      padding: EdgeInsets.all(padding.toDouble()),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.cover,
              )),
          child: child,
        ),
      ),
    );
  }
}
