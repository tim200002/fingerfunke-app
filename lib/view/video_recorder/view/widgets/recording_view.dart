import 'package:camera/camera.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class RecordingView extends StatelessWidget {
  final CameraController controller;
  final UnixMs startTime;
  const RecordingView(
      {Key? key, required this.startTime, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevTools.placeholder("Recording view");
  }
}
