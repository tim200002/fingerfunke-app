import 'package:flutter/material.dart';

import '../../models/user/user.dart';
import '../../view/user_profile/profile_view.dart';
import '../image/user_image/user_image.dart';

class UserInfoView extends StatelessWidget {
  final UserInfo _userInfo;
  final Color? color;
  final bool vertical;
  final bool compact;
  final EdgeInsets margin;
  const UserInfoView(this._userInfo,
      {super.key,
      this.color,
      this.vertical = false,
      this.compact = false,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          UserProfileView.showAsBottomSheet(context, userId: _userInfo.id),
      child: Padding(
        padding: margin,
        child: vertical
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserImage(
                    _userInfo.picture,
                    diameter: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _userInfo.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: color, fontWeight: FontWeight.bold),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserImage(
                    _userInfo.picture,
                    diameter: compact ? 24 : 34,
                  ),
                  SizedBox(width: compact ? 6 : 15),
                  Text(
                    _userInfo.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: color),
                  )
                ],
              ),
      ),
    );
  }
}
