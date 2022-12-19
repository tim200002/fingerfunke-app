import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cubits/app_cubit/app_cubit.dart';
import '../../models/user/user.dart';
import 'social_media_services.dart';

class _SocialAccount {
  final String username;
  final SocialMediaService service;
  const _SocialAccount(this.username, this.service);
}

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({super.key});

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
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      List<_SocialAccount> accounts = _getAccounts(state.user);
      return Wrap(
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
      );
    });
  }
}
