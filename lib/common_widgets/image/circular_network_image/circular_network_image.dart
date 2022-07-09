import '../network_placeholder_asset_image/network_placeholder_asset_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/type_aliases.dart';

class CircularNetworkImage extends StatelessWidget {
  final Link imageUrl;
  final AssetImage placeholder;
  final int? diameter;
  const CircularNetworkImage(this.imageUrl, this.placeholder,
      {Key? key, this.diameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      //Todo do we need custom clipper
      child: NetworkPlaceholderAssetImage(
        imageUrl,
        placeholder,
        width: diameter,
        height: diameter,
        fit: BoxFit.cover,
      ),
    );
  }
}
