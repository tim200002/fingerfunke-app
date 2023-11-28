import 'package:flutter/material.dart';

import '../../utils/illustration.dart';
import '../../utils/tools.dart';

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
          Text(l10n(context).lbl_errorTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
          const SizedBox(
            height: 10,
          ),
          Text(
            l10n(context).lbl_errorCantView,
            textAlign: TextAlign.center,
            //style: Theme.of(context).textTheme.headline3
          ),
        ],
      ),
    );
  }
}
