import 'package:fingerfunke_app/models/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_repository.impl.dart';

abstract class SettingsRepository{
  Future<Settings> getSettings();
  Future<void> updateSettings(Settings settings);
}