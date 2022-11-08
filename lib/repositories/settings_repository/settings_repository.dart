import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/settings/app_settings.dart';

part 'settings_repository.impl.dart';

abstract class SettingsRepository {
  AppSettings getSettings();
  void updateSettings(AppSettings settings);
}
