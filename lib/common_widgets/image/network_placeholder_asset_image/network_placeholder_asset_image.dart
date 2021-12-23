import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:flutter/material.dart';

class NetworkPlaceholderAssetImage extends StatelessWidget {
  final Link imageUrl;
  final AssetImage placeholder;
  final int? height;
  final int? width;
  final BoxFit? fit;
  const NetworkPlaceholderAssetImage(this.imageUrl, this.placeholder,
      {Key? key, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkPlaceholderImage(
      imageUrl,
      Image(
        fit: fit,
        image: placeholder,
      ),
      height: height,
      width: width,
      fit: fit,
    );
  }
}
