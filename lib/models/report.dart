import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:uuid/uuid.dart';

import 'abstract_models/abstract_models.dart';

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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "author": author.toJson(),
      "reasons": reasons.map((e) => e.name).toList(),
      "type": type.name,
      "state": state.name,
      "objectReference": objectReference,
      "creationTime": dateToJson(creationTime),
    };
  }
}
