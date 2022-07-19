import '../../../utils/util_widgets/admin_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../../routes.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar.widget(context, AdminFunction.moderation,
          title: "Übersicht"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SettingsTile(
              title: "gemeldete Posts",
              subtitle: "Von Nutzern gemeldete Inhalte verwalten",
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
