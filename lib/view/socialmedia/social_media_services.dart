import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SocialMediaService {
  final String host;
  final String name;
  final IconData icon;
  final String profilePath;

  const SocialMediaService(this.host, this.name, this.icon, this.profilePath);

  static const List<SocialMediaService> services = [
    SocialMediaService(
        "instagram.com", "Instagram", FeatherIcons.instagram, "/"),
    SocialMediaService("twitter.com", "Twitter", FeatherIcons.twitter, "/"),
  ];
}
