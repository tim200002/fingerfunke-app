import '../../../../../cubits/settings_cubit/settings_cubit.dart';
import '../../../../../models/settings/settings_model.dart';
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
        title: const Text("Einstellungen"),
      ),
      body: BlocBuilder<SettingsCubit, Settings>(
        builder: (context, settings) {
          return ListView(
            children: [
              SettingsSection(
                tiles: [
                  SettingsTile(
                      title: 'Sprache',
                      subtitle: settings.locale.substring(3),
                      leading: const Icon(Icons.language),
                      onPressed: (BuildContext context) =>
                          showFloatingModalBottomSheet(
                            context: context,
                            builder: (context) => const SettingsLanguage(),
                          )),
                  SettingsTile(
                      title: 'Theme',
                      subtitle: toBeginningOfSentenceCase(
                          settings.themeMode.toString().substring(10)),
                      leading: const Icon(Icons.dark_mode),
                      onPressed: (BuildContext context) =>
                          showFloatingModalBottomSheet(
                            context: context,
                            builder: (context) => const SettingsThemePage(),
                          )),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
