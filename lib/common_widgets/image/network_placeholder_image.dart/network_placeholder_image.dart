import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/tools.dart';

import 'package:flutter/material.dart';
import '../../../utils/type_aliases.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NetworkPlaceholderImage extends StatelessWidget {
  final Link imageUrl;
  final Widget placeholder;
  final double? height;
  final double? width;
  final int transitionMs;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const NetworkPlaceholderImage(this.imageUrl, this.placeholder,
      {Key? key,
      this.height,
      this.width,
      this.fit,
      this.transitionMs = 200,
      this.borderRadius})
      : super(key: key);

  Widget _trueNetworkImage(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                FeatherIcons.alertCircle,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(height: 15),
              Text(
                l10n(context).lbl_imageLoadError,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  Widget _base64NetworkImage(BuildContext context) {
    // convert image url to base64
    final base64 = imageUrl.split(',')[1];
    return Image.memory(
      base64Decode(base64),
      width: width,
      height: height,
      fit: fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('data:image')) {
      return _base64NetworkImage(context);
    }
    return _trueNetworkImage(context);
  }
}
