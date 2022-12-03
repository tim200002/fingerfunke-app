import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/type_aliases.dart';

class InvalidDocumentSnapshotException implements Exception {}

JsonMap documentSnaphsotToJson(DocumentSnapshot documentSnapshot) {
  // This whole transformation looks a bit ugly but that is due to the new firebase
  // data format which asks us to directly specify the type <Map<String, dynamic>>
  if (documentSnapshot.data() == null) {
    throw InvalidDocumentSnapshotException();
  }
  return (documentSnapshot as DocumentSnapshot<JsonMap>).data()!;
}

int dateToJson(DateTime date) => date.millisecondsSinceEpoch;

DateTime dateFromJson(int millisecondsSinceEpoch) =>
    DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
