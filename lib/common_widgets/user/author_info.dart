import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';

class AuthorInfo extends StatelessWidget {
  final UserInfo _userInfo;
  const AuthorInfo(this._userInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: UserImage(
            _userInfo.picture?.downloadUrl,
            diameter: 27,
          ),
        ),
        Text(
          _userInfo.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
