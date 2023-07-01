import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../utils.dart';

enum NotificationType { message, postEdited }

class Notification extends DatabaseDocument {
  final NotificationType notificationType;
  final DateTime creationTime;
  final String? objectRef;
  final Map<String, dynamic> rawInfo;

  const Notification({
    required id,
    required this.notificationType,
    required this.creationTime,
    this.objectRef,
    required this.rawInfo,
  }) : super(id: id);

  factory Notification.fromJson(JsonMap map) => Notification(
        id: map['id'] as FirestoreId,
        notificationType: NotificationType.values
            .firstWhere((element) => element.name == map['notificationType']),
        creationTime: dateFromJson(map['creationDate']),
        objectRef: map['objectRef'] as String?,
        rawInfo: map['rawInfo'] as Map<String, dynamic>,
      );

  factory Notification.fromDoc(DocumentSnapshot document) =>
      Notification.fromJson(documentSnaphsotToJson(document));

  @override
  JsonMap toJson() => {
        ...super.toJson(),
        'notificationType': notificationType.name,
        'creationDate': dateToJson(creationTime),
        'objectRef': objectRef,
        'rawInfo': rawInfo,
      };
}
