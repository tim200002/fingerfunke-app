import '../../../models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../../routes.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/clearance_appbar.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClearanceAppBar.widget(context, UserClearance.moderation,
          title: l10n(context).lbl_modOverview),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SettingsTile(
              title: l10n(context).lbl_modReportedPosts,
              subtitle: l10n(context).lbl_modReportedPostsDesc,
              trailing: const Icon(Icons.arrow_forward_ios),
              onPressed: (_) =>
                  Navigator.of(context).pushNamed(Routes.moderationPosts),
            )
          ],
        ),
      ),
    );
  }
}
