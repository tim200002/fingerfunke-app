import '../../routes.dart';
import '../../utils/dev_tools.dart';
import '../../utils/tools.dart';
import '../../utils/util_widgets/page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScreen(
        appBar: PageAppBar(
          context,
          title: l10n(context).lbl_information,
          closable: true,
        ),
        body: FFSettingsSection(
          title: l10n(context).lbl_information,
          tiles: [
            SettingsTile(
                title: l10n(context).lbl_privacy,
                leading: const Icon(Icons.privacy_tip_outlined),
                onPressed: (context) => DevTools.showToDoSnackbar(context)),
            SettingsTile(
                title: l10n(context).lbl_imprint,
                leading: const Icon(Icons.notes_rounded),
                onPressed: (context) => DevTools.showToDoSnackbar(context)),
            SettingsTile(
                title: l10n(context).lbl_licenses,
                leading: const Icon(Icons.gavel_outlined),
                onPressed: (context) {
                  Navigator.of(context).pushNamed(Routes.licenses);
                }),
          ],
        ));
  }
}

class FFSettingsSection extends StatelessWidget {
  final List<SettingsTile> tiles;
  final String title;

  const FFSettingsSection({Key? key, required this.title, required this.tiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(children: tiles));
  }
}
