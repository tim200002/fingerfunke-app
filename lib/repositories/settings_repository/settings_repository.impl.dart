part of './settings_repository.dart';

/// A service that stores and retrieves user settings.
class SettingsRepositoryImpl implements SettingsRepository {
  final themeKey = 'themeMode';
  final localeKey = 'locale';

  /// Persists the user's preferred settings to local storage.
  @override
  Future<void> updateSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, settings.themeMode.toString());
    prefs.setString(localeKey, settings.locale);
  }



  /// Loads User settings from local storage.
  @override
  Future<Settings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final ThemeMode storedTheme;
    switch (prefs.getString(themeKey)) {
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
    final storedLocale = prefs.getString(localeKey);

    return Settings(
        themeMode: storedTheme,
        locale: storedLocale ?? 'en_EN'
    );
  }
}
