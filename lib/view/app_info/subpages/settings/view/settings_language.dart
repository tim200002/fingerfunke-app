import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import '../../../../../services/session_info_service.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

  final languages = const [
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
                  onTap: () {
                    String newLocale = languages[index].keys.first;
                    GetIt.I<SessionInfoService>().setLocale(newLocale);
                    context.read<AppSettingsCubit>().set(context,
                        settings: settings.copyWith(locale: newLocale));
                  },
                )),
      )),
    );
  }
}
