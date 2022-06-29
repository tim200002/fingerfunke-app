import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';

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
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)
              .copyWith(color: color),
        )
      ],
    );
  }
}
