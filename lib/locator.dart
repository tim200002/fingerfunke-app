import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'cache/lru_cache/lru_cache.dart';
import 'models/user/user.dart';
import 'repositories/storage_repository/storage_repository.dart';

final GetIt _getIt = GetIt.instance();

void setupGetIt() {
  _getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  _getIt.registerSingleton<LRUCache<UserInfo>>(LRUCache<UserInfo>(30));
  _getIt.registerSingleton<StorageRepository>(StorageRepositoryImpl());
}
