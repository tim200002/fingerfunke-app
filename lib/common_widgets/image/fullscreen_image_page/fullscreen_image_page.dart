import 'package:flutter/material.dart';

import '../../../utils/type_aliases.dart';
import '../network_placeholder_image.dart/network_placeholder_image.dart';

class FullscreenImagePage extends StatelessWidget {
  final Link imageUrl;
  const FullscreenImagePage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: NetworkPlaceholderImage(
        imageUrl,
        CircularProgressIndicator.adaptive(),
        fit: BoxFit.contain,
      )),
    );
  }
}
