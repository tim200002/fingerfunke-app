import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../../models/asset/asset.dart';
import '../../../../models/place.dart';
import '../../../../models/post/post.dart';
import '../../../../models/user/user.dart';
import '../../../../repositories/post_repository/post_repository.impl.dart';
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
              children: [
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
