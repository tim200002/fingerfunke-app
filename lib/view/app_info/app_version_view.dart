import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/app_info/app_info_cubit.dart';

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
    return Container(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<AppInfoCubit, AppInfoState>(
            builder: (_, info) => Row(
                  mainAxisAlignment: alignment,
                  mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    Text(
                        (compact ? "v" : "Version:") + info.packageInfo.version,
                        style: style),
                    if (!compact) const SizedBox(width: 10),
                    Text(
                      (compact ? "+" : "Build:") + info.packageInfo.buildNumber,
                      style: style.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                )));
  }
}
