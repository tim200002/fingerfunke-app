import 'package:flutter/material.dart';

/// Holds locally stored app settings
class Settings {
  final ThemeMode themeMode;
  final String locale;

  const Settings({
    required this.themeMode,
    required this.locale,
  });

  Settings copyWith({
    ThemeMode? themeMode,
    String? locale,
    double? textScale,
  }) =>
      Settings(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Settings &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode &&
          locale == other.locale;

  @override
  int get hashCode => themeMode.hashCode ^ locale.hashCode;
}
