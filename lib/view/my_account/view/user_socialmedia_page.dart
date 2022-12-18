import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../utils/tools.dart';

class _SocialMedia {
  final String name;
  final String id;
  final IconData icon;

  const _SocialMedia(this.id, this.name, this.icon);
}

class UserSocialMediaPage extends StatelessWidget {
  const UserSocialMediaPage({super.key});

  static const List<_SocialMedia> _services = [
    _SocialMedia("instagram", "Instagram", FeatherIcons.instagram),
    _SocialMedia("twitter", "Twitter", FeatherIcons.twitter),
    //_SocialMedia("layout", "Website", FeatherIcons.layout),
  ];

  Widget _item(BuildContext context, _SocialMedia service) {
    return Container(
      padding: const EdgeInsets.only(bottom: 27),
      child: Row(
        children: [
          Icon(service.icon),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(service.name),
                const Text(
                  "@fingerfunke",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(l10n(context).lbl_socialMedia)),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        itemCount: _services.length,
        itemBuilder: (context, i) => _item(context, _services[i]),
      ),
    );
  }
}
