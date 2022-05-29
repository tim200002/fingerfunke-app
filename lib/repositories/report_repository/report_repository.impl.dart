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
  Future<List<Report>> getReports({bool onlyOpen = false}) async {
    var docs = await (onlyOpen
            ? _reportCollection.where("state", isEqualTo: "open")
            : _reportCollection)
        .get();
    // sorting on client side to not require setting an index in firebase
    return docs.docs.map((m) => Report.fromDoc(m)).toList()
      ..sort((a, b) => a.creationTime.compareTo(b.creationTime))
      ..toList();
  }

  @override
  Future<void> updateReport(Report report) async {
    await _reportCollection.doc(report.id).update(report.toJson());
  }
}
