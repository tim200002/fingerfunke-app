import 'package:flutter/material.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';

/// Holds locally stored app settings
class AppSettings extends Serializable {
  final String locale;
  final ThemeMode themeMode;

  // ds - data save
  final bool dsAutoplay;

  const AppSettings({
    String? locale,
    ThemeMode? themeMode,
    bool? dsAutoplay,
  })  : locale = locale ?? "system",
        themeMode = themeMode ?? ThemeMode.light,
        dsAutoplay = dsAutoplay ?? true;

  AppSettings copyWith(
          {final String? locale,
          final ThemeMode? themeMode,
          final bool? dsAutoplay}) =>
      AppSettings(
          locale: locale ?? this.locale,
          themeMode: themeMode ?? this.themeMode,
          dsAutoplay: dsAutoplay ?? this.dsAutoplay);

  @override
  JsonMap toJson() => {
        "locale": locale,
        "themeMode": themeMode.index,
        "dsAutoplay": dsAutoplay,
      };

  factory AppSettings.fromJson(JsonMap map) => AppSettings(
      locale: _read<String>(map, "locale"),
      themeMode: _read<ThemeMode>(map, "themeMode", (v) => ThemeMode.values[v]),
      dsAutoplay: _read<bool>(map, "dsAutoplay"));

  static T? _read<T>(JsonMap map, String key, [T Function(dynamic v)? parse]) {
    if (!map.containsKey(key)) return null;
    if (parse == null) return map[key] as T;
    return parse(map[key]);
  }
}
