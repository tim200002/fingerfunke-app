part of './settings_repository.dart';

//TODO: implement dsAutoplay persistment

/// A service that stores and retrieves user settings.
class SettingsRepositoryImpl implements SettingsRepository {
  final sbox = GetStorage("settings");

  /// Persists the user's preferred settings to local storage.
  @override
  Future<void> setSettings(AppSettings settings) async {
    await sbox.write("app", settings.toJson());
    await sbox.save();
  }

  /// Loads User settings from local storage.
  @override
  AppSettings getSettings() {
    print(sbox.read("app"));
    if (!sbox.hasData("app")) return const AppSettings();
    return AppSettings.fromJson(sbox.read<Map<String, dynamic>>("app") ?? {});
  }
}
