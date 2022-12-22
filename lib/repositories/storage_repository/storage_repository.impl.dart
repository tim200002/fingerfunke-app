part of 'storage_repository.dart';

/// A service that stores and retrieves user settings.
class StorageRepositoryImpl implements StorageRepository {
  final sBox = GetStorage("settings");
  final lBox = GetStorage("location");
  final lfBox = GetStorage("location_filter");

  @override
  AppSettings? getSettings() => _getJson(sBox, onData: AppSettings.fromJson);

  @override
  setSettings(AppSettings settings) => _setJson(sBox, settings);

  @override
  Place? getLocation() => _getJson(lBox, onData: Place.fromJson);

  @override
  setLocation(Place location) => _setJson(lBox, location);

  @override
  FeedFilterState? get feedFilterSettings => _getJson(lfBox, onData: FeedFilterState.fromJson);

  @override
  Future<void> setFeedFilterSettings(FeedFilterState feedFilterSettings) => _setJson(lfBox, feedFilterSettings);

  // HELPER FUNCTIONS

  @override
  Future<void> init() async {
    await GetStorage.init("settings");
    await GetStorage.init("location");
    await GetStorage.init("location_filter");
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
