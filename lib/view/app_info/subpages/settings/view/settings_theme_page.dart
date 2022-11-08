import '../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import 'package:flutter/material.dart';

import 'sample_text_widget.dart';

class SettingsThemePage extends StatefulWidget {
  const SettingsThemePage({Key? key}) : super(key: key);

  @override
  State<SettingsThemePage> createState() => _SettingsThemePageState();
}

class _SettingsThemePageState extends State<SettingsThemePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SampleTextWidget(),
              ListTile(
                title: const Text('System Theme'),
                trailing: AppSettingsCubit.of(context).state.themeMode ==
                        ThemeMode.system
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  AppSettingsCubit.of(context).set(themeMode: ThemeMode.system);
                  setState(() {});
                },
              ),
              ListTile(
                title: const Text('Light Theme'),
                trailing: AppSettingsCubit.of(context).state.themeMode ==
                        ThemeMode.light
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  AppSettingsCubit.of(context).set(themeMode: ThemeMode.light);
                  setState(() {});
                },
              ),
              ListTile(
                title: const Text('Dark Theme'),
                trailing: AppSettingsCubit.of(context).state.themeMode ==
                        ThemeMode.dark
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  AppSettingsCubit.of(context).set(themeMode: ThemeMode.dark);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
