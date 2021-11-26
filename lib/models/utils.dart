import 'package:cloud_firestore/cloud_firestore.dart';

class InvalidDocumentSnapshotException implements Exception {}

Map<String, dynamic> documentSnaphsotToJson(DocumentSnapshot documentSnapshot) {
  // This whole transformation looks a bit ugly but that is due to the new firebase
  // data format which asks us to directly psecify the type <Map<String, dynamic>>
  if (documentSnapshot.data() == null) {
    throw InvalidDocumentSnapshotException();
  }
  return (documentSnapshot as DocumentSnapshot<Map<String, dynamic>>).data()!;
}

int dateToJson(DateTime date) => date.millisecondsSinceEpoch;

DateTime dateFromJson(int millisecondsSinceEpoch) =>
    DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
