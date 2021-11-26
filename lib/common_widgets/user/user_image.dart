import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: DevTools.colorPlaceholder,
      ),
    );
  }
}
