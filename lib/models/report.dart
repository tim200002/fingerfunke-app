import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../utils/type_aliases.dart';
import 'abstract_models/abstract_models.dart';
import 'utils.dart';

enum ReportReason {
  harassment,
  hate,
  violance,
  sexualization,
  copyright,
  misinformation,
  spam
}

enum ReportState { open, accepted, rejected }

enum ReportType { post, message, user }

class Report extends UserGeneratedDocument {
  final List<ReportReason> reasons;
  final ReportType type;
  final ReportState state;
  final String objectReference;

  Report({
    String? id,
    required FirestoreId authorId,
    required this.reasons,
    required this.type,
    this.state = ReportState.open,
    required this.objectReference,
    required DateTime creationTime,
  }) : super(
            id: id ?? const Uuid().v4(),
            authorId: authorId,
            creationTime: creationTime);

  @override
  JsonMap toJson() => {
        "id": id,
        "objectReference": objectReference,
        "authorId": authorId,
        "reasons": reasons.map((e) => e.name).toList(),
        "type": type.name,
        "state": state.name,
        "creationTime": dateToJson(creationTime)
      };

  factory Report.fromDoc(DocumentSnapshot document) =>
      Report.fromJson(documentSnaphsotToJson(document));

  factory Report.fromJson(JsonMap map) {
    return Report(
        id: map["id"] as String,
        creationTime: dateFromJson(map['creationTime'] as int),
        authorId: map["authorId"],
        reasons: (map["reasons"] as List<dynamic>)
            .map((e) => ReportReason.values.firstWhere((r) => r.name == e))
            .toList(),
        type: ReportType.values.firstWhere((r) => r.name == map["type"]),
        state: ReportState.values.firstWhere((r) => r.name == map["state"]),
        objectReference: map["objectReference"]);
  }

  Report copyWith(
      {String? id,
      FirestoreId? authorId,
      List<ReportReason>? reasons,
      ReportType? type,
      ReportState? state,
      String? objectReference,
      DateTime? creationTime}) {
    return Report(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        reasons: reasons ?? this.reasons,
        type: type ?? this.type,
        state: state ?? this.state,
        objectReference: objectReference ?? this.objectReference,
        creationTime: creationTime ?? this.creationTime);
  }
}
