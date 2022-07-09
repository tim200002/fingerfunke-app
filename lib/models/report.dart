import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'abstract_models/abstract_models.dart';
import 'user/user.dart';
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
    required UserInfo author,
    required this.reasons,
    required this.type,
    this.state = ReportState.open,
    required this.objectReference,
    required DateTime creationTime,
  }) : super(
            id: id ?? const Uuid().v4(),
            author: author,
            creationTime: creationTime);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "objectReference": objectReference,
      "author": author.toJson(),
      "reasons": reasons.map((e) => e.name).toList(),
      "type": type.name,
      "state": state.name,
      "creationTime": dateToJson(creationTime),
    };
  }

  factory Report.fromDoc(DocumentSnapshot document) =>
      Report.fromJson(documentSnaphsotToJson(document));

  factory Report.fromJson(Map<String, dynamic> map) {
    return Report(
        id: map["id"] as String,
        creationTime: dateFromJson(map['creationTime'] as int),
        author: UserInfo.fromJson(map["author"]),
        reasons: (map["reasons"] as List<dynamic>)
            .map((e) => ReportReason.values.firstWhere((r) => r.name == e))
            .toList(),
        type: ReportType.values.firstWhere((r) => r.name == map["type"]),
        state: ReportState.values.firstWhere((r) => r.name == map["state"]),
        objectReference: map["objectReference"]);
  }

  Report copyWith(
      {String? id,
      UserInfo? author,
      List<ReportReason>? reasons,
      ReportType? type,
      ReportState? state,
      String? objectReference,
      DateTime? creationTime}) {
    return Report(
        id: id ?? this.id,
        author: author ?? this.author,
        reasons: reasons ?? this.reasons,
        type: type ?? this.type,
        state: state ?? this.state,
        objectReference: objectReference ?? this.objectReference,
        creationTime: creationTime ?? this.creationTime);
  }
}
