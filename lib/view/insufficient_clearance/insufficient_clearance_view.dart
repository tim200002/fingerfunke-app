import 'package:flutter/material.dart';

import '../../utils/illustration.dart';

class InsufficientClearanceView extends StatelessWidget {
  const InsufficientClearanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 140, bottom: 60),
              child: Center(
                  child: Illustration(
                Illustrations.door,
                height: 150,
              ))),
          Text("Oh no :/",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Diese Inhalte können leider nicht angezeigt werden",
            textAlign: TextAlign.center,
            //style: Theme.of(context).textTheme.headline3
          ),
        ],
      ),
    );
  }
}
