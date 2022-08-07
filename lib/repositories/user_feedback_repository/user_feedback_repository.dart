import 'dart:async';

import '../../models/user_feedback.dart';

abstract class UserFeedbackRepository {
  Future<void> createReport(UserFeedback report);
  Future<void> updateReport(UserFeedback report);
  Future<List<UserFeedback>> getReports({bool onlyOpen = false});
}
