import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/settings/app_settings.dart';
import '../../repositories/settings_repository/settings_repository.dart';

part 'app_settings_state.dart';
part 'app_settings_cubit.freezed.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  final SettingsRepository _settingsRepository = SettingsRepositoryImpl();
  AppSettingsCubit() : super(const AppSettings()) {
    emit(_settingsRepository.getSettings());
  }

  factory AppSettingsCubit.of(BuildContext context) =>
      BlocProvider.of<AppSettingsCubit>(context);

  void set({
    String? locale,
    ThemeMode? themeMode,
    bool? dsAutoplay,
  }) async {
    var settings = AppSettings(
        locale: locale ?? state.locale,
        themeMode: themeMode ?? state.themeMode,
        dsAutoplay: dsAutoplay ?? state.dsAutoplay);
    await _settingsRepository.setSettings(settings);
    emit(settings);
  }
}
