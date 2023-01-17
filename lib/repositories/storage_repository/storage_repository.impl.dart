part of 'storage_repository.dart';

/// A service that stores and retrieves user settings.
class StorageRepositoryImpl implements StorageRepository {
  final settingsBox = GetStorage("settings");
  final infoBox = GetStorage("info");
  final feedFilterBox = GetStorage("feed_filter");

  late final Map<String, GetStorage> _map = {
    "settings": settingsBox,
    "info": infoBox,
    "feed_filter": feedFilterBox
  };

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

  @override
  T? getInfo<T>(String key) =>
      infoBox.hasData(key) ? infoBox.read<T>(key) : null;

  @override
  Future<void> setInfo<T>(String key, T value) async {
    await infoBox.write(key, value);
    await infoBox.save();
  }

  // HELPER FUNCTIONS

  @override
  Future<void> init() async {
    await GetStorage.init("info");
    await GetStorage.init("settings");
    await GetStorage.init("feed_filter");
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

  @override
  Future<void> deleteBoxContent(String name) async {
    await _map[name]!.erase();
  }

  @override
  Map<String, dynamic> getBoxContent(String name) {
    List<String> keys = _map[name]!.getKeys().toList();
    Map<String, dynamic> data = {};
    for (String key in keys) {
      if (_map[name]!.hasData(key)) {
        data.putIfAbsent(key, () => _map[name]!.read(key));
      }
    }
    return data;
  }

  @override
  List<String> getBoxNames() => _map.keys.toList();
}
