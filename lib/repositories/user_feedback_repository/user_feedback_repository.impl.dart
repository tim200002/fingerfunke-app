import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../models/report.dart';
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
  Future<List<UserFeedback>> getReports({bool onlyOpen = false}) async {
    var docs = await (onlyOpen
            ? _reportCollection.where("state", isEqualTo: "open")
            : _reportCollection)
        .get();
    // sorting on client side to not require setting an index in firebase
    return docs.docs.map((m) => UserFeedback.fromDoc(m)).toList()
      ..sort((a, b) => a.creationTime.compareTo(b.creationTime))
      ..toList();
  }

  @override
  Future<void> updateReport(UserFeedback report) async {
    await _reportCollection.doc(report.id).update(report.toJson());
  }
}
