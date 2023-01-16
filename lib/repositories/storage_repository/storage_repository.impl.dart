part of 'storage_repository.dart';

/// A service that stores and retrieves user settings.
class StorageRepositoryImpl implements StorageRepository {
  final settingsBox = GetStorage("settings");
  final feedFilterBox = GetStorage("feed_filter");

  @override
  AppSettings? getSettings() =>
      _getJson(settingsBox, onData: AppSettings.fromJson);

  @override
  setSettings(AppSettings settings) => _setJson(settingsBox, settings);

  @override
  FeedFilter? getFeedFilter() =>
      _getJson(feedFilterBox, onData: FeedFilter.fromJson);

  @override
  Future<void> setFeedFilter(FeedFilter filter) =>
      _setJson(feedFilterBox, filter);

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
