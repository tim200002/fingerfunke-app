import 'package:flutter/material.dart';

void showLoadingOverlay(BuildContext context) {
  showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return const SizedBox.expand(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      });
}
