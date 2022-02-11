import 'package:flutter/material.dart';

class MissingCameraPermissionView extends StatelessWidget {
  const MissingCameraPermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              "Ooop sieht so aus als hättest du uns verboten die Kamera zu verwenden. Bevor du den Video Editor verwenden kannst musst du das zuerst in deinen Einstellungen ändern"),
        ),
      ),
    );
  }
}
