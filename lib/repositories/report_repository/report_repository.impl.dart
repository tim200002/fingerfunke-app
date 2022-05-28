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
    print(_reportCollection.path);
    await _reportCollection.doc(report.id).set(report.toJson());
  }
}
