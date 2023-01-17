import 'package:flutter/material.dart';

import 'main_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      MainView(),
      //Align(alignment: Alignment.bottomCenter, child: TutorialOverlay())
    ]);
  }
}
