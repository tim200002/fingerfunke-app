import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../models/user_feedback.dart';
import 'user_feedback_repository.dart';

class UserFeedbackRepositoryImpl implements UserFeedbackRepository {
  final FirebaseFirestore _firestore;
  late final CollectionReference _reportCollection;

  UserFeedbackRepositoryImpl(
      {FirebaseFirestore? firestore, FirebaseFunctions? functions})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _reportCollection = _firestore.collection('feedback');
  }

  @override
  Future<void> createReport(UserFeedback report) async {
    await _reportCollection.doc(report.id).set(report.toJson());
  }

  @override
  Stream<List<UserFeedback>> observeReports({bool onlyOpen = false}) {
    return (onlyOpen
            ? _reportCollection.where("state", isEqualTo: "open")
            : _reportCollection)
        .snapshots()
        .map((event) {
      return event.docs.map((m) => UserFeedback.fromDoc(m)).toList()
        ..sort((a, b) => b.creationTime.compareTo(a.creationTime))
        ..toList();
    });
  }

  @override
  Stream<UserFeedback> observeReport({required String id}) {
    return _reportCollection
        .doc(id)
        .snapshots()
        .map((doc) => UserFeedback.fromDoc(doc));
  }

  @override
  Future<void> updateReport(UserFeedback report) async {
    await _reportCollection.doc(report.id).set(report.toJson());
  }

  @override
  Future<void> updateReportState(
      String reportId, UserFeedbackState state) async {
    await _reportCollection.doc(reportId).update({"state": state.name});
  }
}
