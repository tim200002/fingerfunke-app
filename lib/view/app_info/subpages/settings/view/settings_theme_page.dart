import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/app_cubit/app_cubit.dart';
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
    return AppSettingsCubit.builder((_, settings) => Material(
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
                    trailing: settings.themeMode == ThemeMode.system
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      context.read<AppSettingsCubit>().set(context,
                          settings:
                              settings.copyWith(themeMode: ThemeMode.system));
                      setState(() {});
                    },
                  ),
                  ListTile(
                    title: const Text('Light Theme'),
                    trailing: settings.themeMode == ThemeMode.light
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      context.read<AppSettingsCubit>().set(context,
                          settings:
                              settings.copyWith(themeMode: ThemeMode.light));
                      setState(() {});
                    },
                  ),
                  ListTile(
                    title: const Text('Dark Theme'),
                    trailing: settings.themeMode == ThemeMode.dark
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      context.read<AppSettingsCubit>().set(context,
                          settings:
                              settings.copyWith(themeMode: ThemeMode.dark));
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
