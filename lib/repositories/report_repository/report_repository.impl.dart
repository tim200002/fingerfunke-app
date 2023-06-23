import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../models/report.dart';
import 'report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final FirebaseFirestore _firestore;
  late final CollectionReference _reportCollection;

  ReportRepositoryImpl(
      {FirebaseFirestore? firestore, FirebaseFunctions? functions})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _reportCollection = _firestore.collection('reports');
  }

  @override
  Future<void> createReport(Report report) async {
    await _reportCollection.doc(report.id).set(report.toJson());
  }

  @override
  Future<List<Report>> getReports({bool onlyOpen = false, ReportType? reportType, int? limitReturnSize}) async {
    Query? query ;
    if(reportType != null){
      query = _reportCollection.where("type", isEqualTo: reportType.name);
    }
    if(onlyOpen){
      query = query?.where("state", isEqualTo: "open");
    }
    query = (query ?? _reportCollection).orderBy("creationTime", descending: true);
    if(limitReturnSize != null){
      query = query.limit(limitReturnSize);
    }
    var docs = await query.get();

    return docs.docs.map((m) => Report.fromDoc(m)).toList();
  }

  @override
  Future<void> updateReport(Report report) async {
    await _reportCollection.doc(report.id).update(report.toJson());
  }
}
