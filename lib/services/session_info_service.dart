import 'dart:ui';

import 'package:intl/intl.dart';

import '../models/place.dart';
import '../repositories/user_repository/user_repository.dart';
import '../utils/type_aliases.dart';

class SessionInfoService {
  static SessionInfoService? _instance;
  static SessionInfoService get instance =>
      _instance ??
      (throw Exception(
          "the SessionInfoService has not been initiated before it was accessed."
          "Make sure you call the .init method first!"));

  static void init(FirestoreId userId) =>
      _instance = SessionInfoService._(userId);

  final UserRepository _userRepository = UserRepositoryImpl();
  final FirestoreId userId;
  SessionInfoService._(this.userId);

  Future<void> _saveToFirestore(String key, dynamic value) async {
    await _userRepository.setSessionInfo(userId, {key: value});
  }

  void setLocale(String locale) {
    _saveToFirestore(
        "locale", (locale == "system" ? Intl.getCurrentLocale() : locale));
  }

  void setLocation(Place place) {
    _saveToFirestore("location", place.geohash);
  }

  void setLocationDistance(int kilometers) {
    _saveToFirestore("locationDistance", kilometers);
  }
}
