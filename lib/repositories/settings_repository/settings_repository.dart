import 'package:fingerfunke_app/models/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

part 'settings_repository.impl.dart';

abstract class SettingsRepository {
  Settings getSettings();
  void updateSettings(Settings settings);
}
