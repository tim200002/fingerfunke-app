import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/settings/settings_model.dart';
import 'package:fingerfunke_app/repositories/settings_repository/settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';

/// Holds and reads user settings, updates user settings, or listens to user settings changes.
class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepositoryImpl _settingsRepository;

  SettingsCubit(this._settingsRepository) : super(const Initial());

  /// Load the user's settings from the SettingsRepository.
  Future<void> loadSettings() async {
    final _settings = await _settingsRepository.getSettings();
    emit(Loaded(_settings));
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateSettings({ThemeMode? newThemeMode, String? locale}) async {
    state.when(
        initial: () {},
        loaded: (Settings settings) async {
          final Settings newSettings =
              settings.copyWith(themeMode: newThemeMode, locale: locale);
          await _settingsRepository.updateSettings(newSettings);
          emit(Loaded(newSettings));
        });
  }
}
