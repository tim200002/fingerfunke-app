import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../services/app_info_service.dart';

class AppVersionView extends StatelessWidget {
  final bool compact;
  final TextStyle style;
  final MainAxisAlignment alignment;
  final bool expand;
  const AppVersionView(
      {super.key,
      this.compact = false,
      this.style = const TextStyle(),
      this.alignment = MainAxisAlignment.center,
      this.expand = true});

  @override
  Widget build(BuildContext context) {
    final PackageInfo info = GetIt.I<AppInfoService>().packageInfo;

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: alignment,
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Text((compact ? "v" : "Version: ") + info.version, style: style),
          if (!compact) const SizedBox(width: 10),
          Text(
            (compact ? "+" : "Build: ") + info.buildNumber,
            style: style.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
