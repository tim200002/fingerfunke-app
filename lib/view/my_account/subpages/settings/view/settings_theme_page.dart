import 'package:fingerfunke_app/cubits/settings_cubit/settings_cubit.dart';
import 'package:fingerfunke_app/view/my_account/subpages/settings/view/sample_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                trailing: BlocProvider.of<SettingsCubit>(context).state.when(
                    initial: () => null,
                    loaded: (settings) =>
                        settings.themeMode == ThemeMode.system
                            ? const Icon(Icons.check)
                            : null),
                onTap: () {
                  BlocProvider.of<SettingsCubit>(context)
                      .updateSettings(newThemeMode: ThemeMode.system);
                  setState(() {});
                },
              ),
              ListTile(
                title: const Text('Light Theme'),
                trailing: BlocProvider.of<SettingsCubit>(context).state.when(
                    initial: () => null,
                    loaded: (settings) =>
                    settings.themeMode == ThemeMode.light
                        ? const Icon(Icons.check)
                        : null),
                onTap: () {
                  BlocProvider.of<SettingsCubit>(context)
                      .updateSettings(newThemeMode: ThemeMode.light);
                  setState(() {});
                },
              ),
              ListTile(
                title: const Text('Dark Theme'),
                trailing: BlocProvider.of<SettingsCubit>(context).state.when(
                    initial: () => null,
                    loaded: (settings) =>
                    settings.themeMode == ThemeMode.dark
                        ? const Icon(Icons.check)
                        : null),
                onTap: () {
                BlocProvider.of<SettingsCubit>(context)
                    .updateSettings(newThemeMode: ThemeMode.dark);
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
