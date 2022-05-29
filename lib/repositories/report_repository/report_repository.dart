import 'dart:async';

import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/models/report.dart';

abstract class ReportRepository {
  Future<void> createReport(Report report);
  Future<void> updateReport(Report report);
  Future<List<Report>> getReports({bool onlyOpen = false});
}
