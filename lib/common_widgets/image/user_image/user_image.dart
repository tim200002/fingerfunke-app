import 'package:flutter/material.dart';

import '../../../utils/type_aliases.dart';
import '../circular_network_image/circular_network_image.dart';

class UserImage extends StatelessWidget {
  final Link? imageUrl;
  final double? diameter;
  final AssetImage placeholder =
      const AssetImage("assets/img/placeholder/profile_avatar_placeholder.png");
  const UserImage(this.imageUrl, {Key? key, this.diameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CircularNetworkImage(
        imageUrl!,
        placeholder,
        diameter: diameter,
      );
    } else {
      return ClipOval(
        child: SizedBox(
          width: diameter?.toDouble(),
          height: diameter?.toDouble(),
          child: Image(
            image: placeholder,
          ),
        ),
      );
    }
  }
}
