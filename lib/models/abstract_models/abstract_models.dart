import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'abstract_models.g.dart';

abstract class DocumentSerializable {
  Map<String, dynamic> toJson();
}

@JsonSerializable(explicitToJson: true)
class DatabaseDocument extends Equatable implements DocumentSerializable {
  final FirestoreId id;

  const DatabaseDocument({required this.id});

  @override
  Map<String, dynamic> toJson() => _$DatabaseDocumentToJson(this);

  factory DatabaseDocument.fromJson(Map<String, dynamic> map) =>
      _$DatabaseDocumentFromJson(map);

  factory DatabaseDocument.fromDoc(DocumentSnapshot document) {
    return DatabaseDocument.fromJson(documentSnaphsotToJson(document));
  }

  @override
  List<Object?> get props => [id];
}

@JsonSerializable(explicitToJson: true)
class UserGeneratedDocument extends DatabaseDocument {
  final UserInfo author;

  @JsonKey(toJson: dateToJson, fromJson: dateFromJson)
  final DateTime creationTime;

  const UserGeneratedDocument(
      {required id, required this.author, required this.creationTime})
      : super(id: id);

  @override
  Map<String, dynamic> toJson() => _$UserGeneratedDocumentToJson(this);

  factory UserGeneratedDocument.fromJson(Map<String, dynamic> map) =>
      _$UserGeneratedDocumentFromJson(map);

  factory UserGeneratedDocument.fromDoc(DocumentSnapshot document) =>
      UserGeneratedDocument.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, author];
}
