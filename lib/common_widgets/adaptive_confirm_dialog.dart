import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/tools.dart';

class AdaptiveConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? cancelBtnLabel;
  final String? okayBtnLabel;
  const AdaptiveConfirmDialog(
      {super.key,
      required this.title,
      required this.description,
      this.okayBtnLabel,
      this.cancelBtnLabel});

  static Future<bool> show(BuildContext context,
          {required String title,
          required String description,
          String? okayBtnLabel,
          String? cancelBtnLabel}) async =>
      (await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AdaptiveConfirmDialog(
              title: title,
              description: description,
              okayBtnLabel: okayBtnLabel,
              cancelBtnLabel: cancelBtnLabel))) ??
      false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: Text(cancelBtnLabel ?? l10n(context).lbl_cancel),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text(okayBtnLabel ?? l10n(context).lbl_okay),
      ),
    ];
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(title), content: Text(description), actions: actions)
        : AlertDialog(
            title: Text(title), content: Text(description), actions: actions);
  }
}
