import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/settings/settings_model.dart';
import 'package:fingerfunke_app/repositories/settings_repository/settings_repository.dart';
import 'package:flutter/material.dart';

/// Holds and reads user settings, updates user settings, or listens to user settings changes.
class SettingsCubit extends Cubit<Settings> {
  final SettingsRepository _settingsRepository;

  factory SettingsCubit(SettingsRepository settingsRepository) {
    final initialSettings = settingsRepository.getSettings();
    return SettingsCubit._hidden(settingsRepository, initialSettings);
  }
  SettingsCubit._hidden(this._settingsRepository, Settings initialSettings)
      : super(initialSettings);

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateSettings({ThemeMode? newThemeMode, String? locale}) async {
    final Settings newSettings =
        state.copyWith(themeMode: newThemeMode, locale: locale);
    _settingsRepository.updateSettings(newSettings);
    emit(newSettings);
  }
}
