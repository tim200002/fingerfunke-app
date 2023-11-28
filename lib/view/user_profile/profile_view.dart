import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widgets/image/user_image/user_image.dart';
import '../../models/user/user.dart';
import '../socialmedia/social_media_links.dart';

class UserProfileView extends StatelessWidget {
  final User _user;
  const UserProfileView(this._user, {super.key});

  static void showAsBottomSheet(BuildContext context, {required User user}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => UserProfileView(user));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
      padding: const EdgeInsets.all(20),
      child: AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UserImage(
                      _user.picture,
                      diameter: 55,
                    ),
                    const SizedBox(width: 20),
                    Text(_user.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(FeatherIcons.x))
              ],
            ),
            if (_user.bio?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  _user.bio!,
                  style: GoogleFonts.signika(fontSize: 15),
                ),
              ),
            SocialMediaLinks(user: _user),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
