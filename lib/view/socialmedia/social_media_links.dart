import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/user/user.dart';
import 'social_media_services.dart';

class _SocialAccount {
  final String username;
  final SocialMediaService service;
  const _SocialAccount(this.username, this.service);
}

class SocialMediaLinks extends StatelessWidget {
  final User user;

  const SocialMediaLinks({super.key, required this.user});

  //TODO: it's a bit ugly to do these calculations on the view side
  List<_SocialAccount> _getAccounts(User user) {
    List<_SocialAccount> accounts = [];
    user.socialMedia.forEach((key, value) {
      for (SocialMediaService s in SocialMediaService.services) {
        if (s.host == key) {
          accounts.add(_SocialAccount(value, s));
          return;
        }
      }
    });
    return accounts;
  }

  @override
  Widget build(BuildContext context) {
    List<_SocialAccount> accounts = _getAccounts(user);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (_SocialAccount a in accounts)
              IconButton(
                  onPressed: () => {
                        launchUrl(
                            Uri.https(a.service.host,
                                "${a.service.profilePath}${a.username}"),
                            mode: LaunchMode.externalNonBrowserApplication)
                      },
                  icon: Icon(a.service.icon))
          ],
        ),
      ],
    );
  }
}
