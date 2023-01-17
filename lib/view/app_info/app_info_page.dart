import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes.dart';
import '../../utils/tools.dart';
import '../../utils/util_widgets/page_screen.dart';
import 'app_version_view.dart';

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
        body: Column(
          children: [
            Expanded(
              child: FFSettingsSection(
                  title: l10n(context).lbl_information,
                  tiles: [
                    SettingsTile(
                        title: l10n(context).lbl_tutorial,
                        leading: const Icon(FeatherIcons.bookOpen),
                        onPressed: (context) =>
                            Navigator.of(context).pushNamed(Routes.tutorial)),
                    SettingsTile(
                        title: l10n(context).lbl_privacy,
                        leading: const Icon(Icons.privacy_tip_outlined),
                        onPressed: (context) => launchUrl(
                            Uri.https("fingerfunke.app", "/privacy.html"))),
                    SettingsTile(
                        title: l10n(context).lbl_imprint,
                        leading: const Icon(Icons.notes_rounded),
                        onPressed: (context) => launchUrl(
                            Uri.https("fingerfunke.app", "/impressum.html"))),
                    SettingsTile(
                        title: l10n(context).lbl_licenses,
                        leading: const Icon(Icons.gavel_outlined),
                        onPressed: (context) {
                          Navigator.of(context).pushNamed(Routes.licenses);
                        }),
                  ]),
            ),
            const SizedBox(height: 20),
            const BMBFIndicator(),
            const SizedBox(height: 20),
            const AppVersionView(),
            const SizedBox(height: 20)
          ],
        ));
  }
}

class BMBFIndicator extends StatelessWidget {
  static const String imageURL = "assets/img/partners/bmbf_logo.jpg";
  const BMBFIndicator({super.key});
  @override
  Widget build(BuildContext context) => Image.asset(imageURL, height: 150);
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
