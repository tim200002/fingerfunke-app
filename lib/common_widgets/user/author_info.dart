import 'package:flutter/material.dart';

import '../../models/user/user.dart';
import '../image/user_image/user_image.dart';

class AuthorInfo extends StatelessWidget {
  final UserInfo _userInfo;
  final Color? color;
  const AuthorInfo(this._userInfo, {this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: UserImage(
            _userInfo.picture,
            diameter: 24,
          ),
        ),
        Text(
          _userInfo.name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
        )
      ],
    );
  }
}
