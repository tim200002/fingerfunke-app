import 'package:flutter/material.dart';

import '../../../../utils/tools.dart';

class MissingCameraPermissionView extends StatelessWidget {
  const MissingCameraPermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(l10n(context).lbl_cameraPermissionError)),
      ),
    );
  }
}
