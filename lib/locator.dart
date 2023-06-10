import 'package:cloud_firestore/cloud_firestore.dart';
import 'repositories/video_repository/video_repository.impl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'cache/lru_cache/lru_cache.dart';
import 'models/user/user.dart';
import 'repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import 'repositories/post_repository/post_repository.dart';
import 'repositories/post_repository/post_repository.impl.dart';
import 'repositories/storage_repository/storage_repository.dart';
import 'repositories/user_repository/user_repository.dart';
import 'repositories/video_repository/video_repository.dart';
import 'services/app_info_service.dart';
import 'services/globals_service.dart';

final GetIt _getIt = GetIt.instance;

void setupGetIt() {
  _getIt.registerSingleton<FirebaseAuthenticationRepository>(FirebaseAuthenticationRepository());
  _getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  _getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  _getIt.registerSingleton<LRUCache<User>>(LRUCache<User>(30));
  _getIt.registerSingleton<StorageRepository>(StorageRepositoryImpl());
  _getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  _getIt.registerSingleton<PostRepository>(PostRepositoryImpl());
  _getIt.registerSingleton<AppInfoService>(AppInfoService());
  _getIt.registerSingleton<GlobalsService>(GlobalsService());
  _getIt.registerSingleton<VideoRepository>(VideoRepositoryImpl());
  //_getIt.registerSingleton<CacheManager>(DefaultCacheManager());
}
