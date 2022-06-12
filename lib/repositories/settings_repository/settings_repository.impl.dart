part of './settings_repository.dart';

/// A service that stores and retrieves user settings.
class SettingsRepositoryImpl implements SettingsRepository {
  final themeKey = 'themeMode';
  final localeKey = 'locale';
  final box = GetStorage();

  /// Persists the user's preferred settings to local storage.
  @override
  void updateSettings(Settings settings) {
    box.write(themeKey, settings.themeMode.toString());
    box.write(localeKey, settings.locale);
  }

  /// Loads User settings from local storage.
  @override
  Settings getSettings() {
    final ThemeMode storedTheme;
    switch (box.read(themeKey)) {
      case 'ThemeMode.light':
        {
          storedTheme = ThemeMode.light;
          break;
        }
      case 'ThemeMode.dark':
        {
          storedTheme = ThemeMode.dark;
          break;
        }
      default:
        storedTheme = ThemeMode.system;
    }
    final storedLocale = box.read(localeKey);

    return Settings(themeMode: storedTheme, locale: storedLocale ?? 'en_EN');
  }
}
