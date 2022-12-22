import 'dart:async';

import 'package:get_storage/get_storage.dart';

import '../../models/abstract_models/abstract_models.dart';
import '../../models/place.dart';
import '../../models/settings/app_settings.dart';
import '../../utils/type_aliases.dart';
import '../../view/main/discover_posts_view/widgets/filter/cubit/feed_filter_state.dart';

part 'storage_repository.impl.dart';

abstract class StorageRepository {
  Future<void> init();

  /// Gets the settings that were previously stored locally
  AppSettings? getSettings();

  /// Persists the user's preferred settings to local storage.
  Future<void> setSettings(AppSettings settings);

  /// Gets the user's location object from local storage
  Place? getLocation();

  /// Persists the user's location within local storage
  Future<void> setLocation(Place location);

  FeedFilterState? get feedFilterSettings;

  Future<void> setFeedFilterSettings(FeedFilterState feedFilterSettings);

}
