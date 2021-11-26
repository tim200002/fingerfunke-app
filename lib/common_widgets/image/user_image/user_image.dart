import 'package:fingerfunke_app/common_widgets/image/circular_network_image/circular_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class UserImage extends StatelessWidget {
  final Link? imageUrl;
  final int? diameter;
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
