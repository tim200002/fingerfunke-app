import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScreen(
        appBar: PageAppBar(
          context,
          title: "Informationen",
          closable: true,
        ),
        body: FFSettingsSection(
          title: "Informationen",
          tiles: [
            SettingsTile(
                title: "Datenschutz",
                leading: const Icon(Icons.privacy_tip_outlined),
                onPressed: (context) => DevTools.showToDoSnackbar(context)),
            SettingsTile(
                title: "Impressum",
                leading: const Icon(Icons.notes_rounded),
                onPressed: (context) => DevTools.showToDoSnackbar(context)),
            SettingsTile(
                title: "Lizenzen",
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
