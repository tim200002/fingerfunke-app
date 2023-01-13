import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/app_cubit/app_cubit.dart';
import '../../../../../cubits/settings_cubit/app_settings_cubit.dart';

class SettingsLanguage extends StatefulWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

  @override
  State<SettingsLanguage> createState() => _SettingsLanguageState();
}

class _SettingsLanguageState extends State<SettingsLanguage> {
  final languages = [
    {"system": "System"},
    {"en_EN": "English"},
    {"de_DE": "Deutsch"}
  ];

  @override
  Widget build(BuildContext context) {
    return AppSettingsCubit.builder(
      (_, settings) => Material(
          child: SafeArea(
        top: false,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(languages[index].values.first),
                  trailing: settings.locale == languages[index].keys.first
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => {
                    setState(() {
                      context.read<AppSettingsCubit>().set(context,
                          settings: settings.copyWith(
                              locale: languages[index].keys.first));
                    })
                  },
                )),
      )),
    );
  }
}
