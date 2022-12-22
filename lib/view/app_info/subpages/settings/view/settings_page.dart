import '../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import '../../../../../models/settings/app_settings.dart';
import '../../../../../utils/tools.dart';
import '../../../../../utils/util_widgets/floating_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:intl/intl.dart';

import 'settings_language.dart';
import 'settings_theme_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(l10n(context).lbl_settings),
      ),
      body: BlocBuilder<AppSettingsCubit, AppSettings>(
        builder: (context, settings) {
          return ListView(
            children: [
              SettingsSection(title: l10n(context).lbl_settingsGeneral, tiles: [
                SettingsTile(
                    title: l10n(context).lbl_settings_language,
                    subtitle: settings.locale,
                    leading: const Icon(Icons.language),
                    onPressed: (BuildContext context) =>
                        showFloatingModalBottomSheet(
                          context: context,
                          builder: (context) => const SettingsLanguage(),
                        )),
              ]),
              SettingsTile(
                  enabled: false,
                  title: l10n(context).lbl_settingsTheme,
                  subtitle: toBeginningOfSentenceCase(
                      settings.themeMode.toString().substring(10)),
                  leading: const Icon(Icons.dark_mode),
                  onPressed: (BuildContext context) =>
                      showFloatingModalBottomSheet(
                        context: context,
                        builder: (context) => const SettingsThemePage(),
                      )),
              SettingsSection(
                title: l10n(context).lbl_settingsDataSave,
                tiles: [
                  SettingsTile.switchTile(
                    title: l10n(context).lbl_settingsVAutoplay,
                    subtitle: l10n(context).lbl_settingsVAutoplayDesc,
                    leading: const Icon(Icons.dark_mode),
                    switchValue: settings.dsAutoplay,
                    onToggle: (bool v) {
                      AppSettingsCubit.of(context).set(dsAutoplay: v);
                    },
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
