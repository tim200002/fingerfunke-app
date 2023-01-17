import 'package:flutter/material.dart';

import '../../utils/dev_tools.dart';

class TutorialOverlay extends StatelessWidget {
  const TutorialOverlay({super.key});

  static void asBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // color is applied to main screen when modal bottom screen is displayed
      //barrierColor: Colors.greenAccent,
      //background color for modal bottom screen
      backgroundColor: Colors.transparent,
      //elevates modal bottom screen
      elevation: 0,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return const Padding(
            padding: EdgeInsets.all(20), child: TutorialOverlay());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Material(child: DevTools.placeholder("Video", height: 400)));
  }
}
