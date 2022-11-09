import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Holds locally stored app settings
class AppSettings extends Equatable {
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

  Map<String, dynamic> toJson() {
    return {
      "locale": locale,
      "themeMode": themeMode.index,
      "dsAutoplay": dsAutoplay,
    };
  }

  factory AppSettings.fromJson(Map<String, dynamic> map) => AppSettings(
      locale: _read<String>(map, "locale"),
      themeMode: _read<ThemeMode>(map, "themeMode", (v) => ThemeMode.values[v]),
      dsAutoplay: _read<bool>(map, "dsAutoplay"));

  static T? _read<T>(Map<String, dynamic> map, String key,
      [T Function(dynamic v)? parse]) {
    if (!map.containsKey(key)) return null;
    if (parse == null) return map[key] as T;
    return parse(map[key]);
  }

  @override
  get props => [locale, themeMode, dsAutoplay];
}
