import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/settings/settings_model.dart';

part 'settings_repository.impl.dart';

abstract class SettingsRepository {
  Settings getSettings();
  void updateSettings(Settings settings);
}
