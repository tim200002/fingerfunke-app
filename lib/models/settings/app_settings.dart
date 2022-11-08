import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Holds locally stored app settings
class AppSettings extends Equatable {
  final String locale;
  final ThemeMode themeMode;

  // ds - data save
  final bool dsFeedAutoplay;

  const AppSettings({
    this.locale = "system",
    this.themeMode = ThemeMode.system,
    this.dsFeedAutoplay = true,
  });

  @override
  get props => [locale, themeMode, dsFeedAutoplay];
}
