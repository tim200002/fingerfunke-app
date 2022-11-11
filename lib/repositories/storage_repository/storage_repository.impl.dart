part of 'storage_repository.dart';

/// A service that stores and retrieves user settings.
class StorageRepositoryImpl implements StorageRepository {
  final sBox = GetStorage("settings");
  final lBox = GetStorage("location");

  @override
  AppSettings? getSettings() => _getJson(sBox, onData: AppSettings.fromJson);

  @override
  setSettings(AppSettings settings) => _setJson(sBox, settings);

  @override
  UserLocation? getLocation() => _getJson(lBox, onData: UserLocation.fromJson);

  @override
  setLocation(UserLocation location) => _setJson(lBox, location);

  // HELPER FUNCTIONS

  @override
  Future<void> init() async {
    await GetStorage.init("settings");
    await GetStorage.init("location");
  }

  Future<void> _setJson(
    GetStorage box,
    Serializable object, {
    String key = "app",
  }) async {
    await box.write(key, object.toJson());
    await box.save();
  }

  T? _getJson<T>(GetStorage box,
      {String key = "app", required T Function(JsonMap map) onData}) {
    if (box.hasData(key)) {
      final JsonMap? map = box.read<JsonMap>(key);
      if (map != null) return onData.call(map);
    }
    return null;
  }
}
