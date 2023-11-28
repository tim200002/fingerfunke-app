import 'dart:async';

import '../../models/report.dart';

abstract class ReportRepository {
  Future<void> createReport(Report report);
  Future<void> updateReport(Report report);
  Future<List<Report>>  getReports({bool onlyOpen = false, ReportType? reportType, int? limitReturnSize});
}
