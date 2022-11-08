part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState(String locale, ThemeMode themeMode) = _Initial;
}
