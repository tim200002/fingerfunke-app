import 'package:fingerfunke_app/cubits/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsLanguage extends StatefulWidget {
  SettingsLanguage({Key? key}) : super(key: key);

  @override
  State<SettingsLanguage> createState() => _SettingsLanguageState();
}

class _SettingsLanguageState extends State<SettingsLanguage> {
  final languages = [
    {"en_EN": "English"},
    {"de_DE": "Deutsch"}
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          top: false,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(languages[index].values.first),
                trailing: BlocProvider.of<SettingsCubit>(context).state.when(
                    initial: () => null,
                    loaded: (settings) =>
                        settings.locale == languages[index].keys.first
                            ? const Icon(Icons.check)
                            : null),
                onTap: () => {
                  setState(() {
                    BlocProvider.of<SettingsCubit>(context)
                        .updateSettings(locale: languages[index].keys.first);
                  })
                },
              );
            },
          )),
    );
  }
}
