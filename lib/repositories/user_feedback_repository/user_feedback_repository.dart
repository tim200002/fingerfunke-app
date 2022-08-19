import 'dart:async';

import '../../models/user_feedback.dart';

abstract class UserFeedbackRepository {
  Future<void> createReport(UserFeedback report);
  Future<void> updateReport(UserFeedback report);
  Future<void> updateReportState(String reportId, UserFeedbackState state);
  Stream<List<UserFeedback>> observeReports({bool onlyOpen = false});
  Stream<UserFeedback> observeReport({required String id});
}
