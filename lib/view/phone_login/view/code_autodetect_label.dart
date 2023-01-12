import 'package:flutter/material.dart';

import '../../../utils/tools.dart';

class LoginCodeAutoDetectLabel extends StatelessWidget {
  final bool active;

  const LoginCodeAutoDetectLabel({Key? key, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: active
          ? Row(
              children: [
                const SizedBox.square(
                    dimension: 10,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                    )),
                const SizedBox(width: 10),
                Expanded(child: Text(l10n(context).lbl_autoDetectingLoginCode))
              ],
            )
          : Text(l10n(context).lbl_loginCodeNotAutoDetectable),
    );
  }
}
