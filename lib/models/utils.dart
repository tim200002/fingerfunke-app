import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> docToMap(DocumentSnapshot document) {
  // This whole transformation looks a bit ugly but that is due to the new firebase
  // data format which asks us to directly psecify the type <Map<String, dynamic>>
  Map<String, dynamic> result =
      (document as DocumentSnapshot<Map<String, dynamic>>).data() ?? {};

  result.addAll({'id': document.id});
  return result;
}
