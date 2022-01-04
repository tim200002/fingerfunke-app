import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class PreviewingView extends StatelessWidget {
  final CameraController controller;
  const PreviewingView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevTools.placeholder("previewing page");
  }
}
