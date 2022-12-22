import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../../models/user/user.dart';
import '../../../../utils/tools.dart';
import '../../../../utils/util_widgets/clearance_appbar.dart';
import '../../../feedback/manage/feedback_manage_page.dart';
import 'settings_dev_functions_page.dart';

class DevToolsPage extends StatelessWidget {
  const DevToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClearanceAppBar.widget(context, UserClearance.development,
          title: l10n(context).lbl_devTools),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SettingsTile(
              title: l10n(context).lbl_devFeedback,
              subtitle: l10n(context).lbl_devFeedbackDesc,
              trailing: const Icon(Icons.arrow_forward_ios),
              onPressed: (_) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FeedbackManagePage())),
            ),
            SettingsTile(
              title: l10n(context).lbl_devActions,
              subtitle: l10n(context).lbl_devActionsDesc,
              trailing: const Icon(Icons.arrow_forward_ios),
              onPressed: (_) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DevFunctionsPage())),
            ),
            const SizedBox(height: 50),
            LiveConfig.builder(
              (config) => SettingsSection(
                  title: "Feature-Flags",
                  tiles: LiveConfig.configs
                      .map((c) => SettingsTile.switchTile(
                          title: (c.unused ? "[OLD] " : "") + c.name,
                          enabled: !c.unused,
                          subtitle: c.description,
                          subtitleMaxLines: 5,
                          onToggle: (s) => c.onToggle(context, s),
                          switchValue: c.isSelected(context)))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
