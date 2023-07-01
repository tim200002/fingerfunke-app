import 'dart:io';

import '../utils/tools.dart';
import 'app_info_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/settings/session_info.dart';
import '../repositories/user_repository/user_repository.dart';
import '../utils/type_aliases.dart';

class SessionInfoService {
  SessionInfo? _session;
  FirestoreId? _userId;
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  Future<void> init(FirestoreId userId) async {
    _userId = userId;
    _session = await _createSession();
    await _saveToFirestore();
  }

  /// To be called on logout, so next user has fresh session info
  void deinit() {
    _session = null;
    _userId = null;
  }

  Future<void> _saveToFirestore() async {
    await _userRepository.setSessionInfo(userId, _session!);
  }

  Future<void> setLocale(String locale) async {
    _session = sessionInfo.copyWith(locale: locale);
    await _saveToFirestore();
  }

  Future<SessionInfo> _createSession() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    // ToDo Is it ok to do this on every start?
    NotificationSettings settings = await firebaseMessaging.requestPermission();

    // To make messaging work
    String? fcmToken;
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      fcmToken = await FirebaseMessaging.instance.getToken();
    }

    // get package info
    final PackageInfo packageInfo = GetIt.I<AppInfoService>().packageInfo;
    final DeviceInfo deviceInfo = GetIt.I<AppInfoService>().deviceInfo;

    return SessionInfo(
      // ToDo this requires better solution
      locale: Intl.getCurrentLocale(),
      version: "${packageInfo.version}+${packageInfo.buildNumber}",
      operatingSystem: Platform.operatingSystem,
      deviceId: deviceInfo.id,
      fcmToken: fcmToken,
      lastUsedAt: DateTime.now(),
    );
  }

  SessionInfo get sessionInfo {
    if (_session == null) {
      throw Exception("SessionInfoService not initialized");
    }
    return _session!;
  }

  FirestoreId get userId {
    if (_userId == null) {
      throw Exception("SessionInfoService not initialized");
    }
    return _userId!;
  }
}
