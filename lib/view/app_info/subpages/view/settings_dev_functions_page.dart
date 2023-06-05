import 'package:flutter/material.dart';

import '../../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../../models/user/user.dart';
import '../../../../utils/tools.dart';
import '../../../../utils/util_widgets/clearance_appbar.dart';

class DevFunctionsPage extends StatelessWidget {
  const DevFunctionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClearanceAppBar.widget(context, UserClearance.development,
          title: l10n(context).lbl_devActions),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LiveConfig.builder(
            (config) => ListView(
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                )
              ],
            ),
          )),
    );
  }
}
