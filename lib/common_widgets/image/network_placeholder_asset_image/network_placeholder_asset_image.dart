import '../network_placeholder_image.dart/network_placeholder_image.dart';
import '../../../utils/type_aliases.dart';
import 'package:flutter/material.dart';

class NetworkPlaceholderAssetImage extends StatelessWidget {
  final Link imageUrl;
  final AssetImage placeholder;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const NetworkPlaceholderAssetImage(this.imageUrl, this.placeholder,
      {Key? key, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkPlaceholderImage(
      imageUrl,
      Image(
        width: width?.toDouble(),
        height: height?.toDouble(),
        fit: fit,
        image: placeholder,
      ),
      height: height,
      width: width,
      fit: fit,
    );
  }
}
