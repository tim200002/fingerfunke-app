import '../repositories/user_repository/user_repository.dart';

class NotificationService {
  static Future<void> setFCMToken(String userId, String? token) async {
    await UserRepositoryImpl().setToken(userId, "fcm", {"value": token});
  }
}
