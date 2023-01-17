import 'dart:async';

import 'package:get_storage/get_storage.dart';

import '../../models/abstract_models/abstract_models.dart';
import '../../models/filter/feed_filter.dart';
import '../../models/settings/app_settings.dart';
import '../../utils/type_aliases.dart';

part 'storage_repository.impl.dart';

abstract class StorageRepository {
  Future<void> init();

  AppSettings? getSettings();

  Future<void> setSettings(AppSettings settings);

  FeedFilter? getFeedFilter();

  Future<void> setFeedFilter(FeedFilter feedFilter);
}
