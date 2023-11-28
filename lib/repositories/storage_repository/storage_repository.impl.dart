part of 'storage_repository.dart';

/// A service that stores and retrieves user settings.
class StorageRepositoryImpl implements StorageRepository {
  late final Map<String, GetStorage> _boxes = {
    "settings": GetStorage("settings"),
    "info": GetStorage("info"),
    "feed_filter": GetStorage("feed_filter")
  };

  GetStorage get _settingsBox => _boxes["settings"]!;
  GetStorage get _infoBox => _boxes["info"]!;
  GetStorage get _feedFilterBox => _boxes["feed_filter"]!;

  @override
  AppSettings? getSettings() =>
      _getJson(_settingsBox, onData: AppSettings.fromJson);

  @override
  setSettings(AppSettings settings) => _setJson(_settingsBox, settings);

  @override
  FeedFilter? getFeedFilter() =>
      _getJson(_feedFilterBox, onData: FeedFilter.fromJson);

  @override
  Future<void> setFeedFilter(FeedFilter filter) =>
      _setJson(_feedFilterBox, filter);

  @override
  T? getInfo<T>(String key) =>
      _infoBox.hasData(key) ? _infoBox.read<T>(key) : null;

  @override
  Future<void> setInfo<T>(String key, T value) async {
    await _infoBox.write(key, value);
    await _infoBox.save();
  }

  // HELPER FUNCTIONS

  @override
  Future<void> init() async {
    for (String name in _boxes.keys) {
      await GetStorage.init(name);
    }
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
    await _boxes[name]!.erase();
  }

  @override
  Map<String, dynamic> getBoxContent(String name) {
    List<String> keys = _boxes[name]!.getKeys().toList();
    Map<String, dynamic> data = {};
    for (String key in keys) {
      if (_boxes[name]!.hasData(key)) {
        data.putIfAbsent(key, () => _boxes[name]!.read(key));
      }
    }
    return data;
  }

  @override
  List<String> getBoxNames() => _boxes.keys.toList();
}
