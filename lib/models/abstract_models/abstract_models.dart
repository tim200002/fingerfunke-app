import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/type_aliases.dart';
import '../user/user.dart';
import '../utils.dart';

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
class GeneratedDocument extends DatabaseDocument{
  @JsonKey(toJson: dateToJson, fromJson: dateFromJson)
  final DateTime creationTime;

  const GeneratedDocument(
  {required id, required this.creationTime})
  : super(id: id);

  @override
  Map<String, dynamic> toJson() => _$GeneratedDocumentToJson(this);

  factory GeneratedDocument.fromJson(Map<String, dynamic> map) =>
      _$GeneratedDocumentFromJson(map);

  factory GeneratedDocument.fromDoc(DocumentSnapshot document) =>
      GeneratedDocument.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, creationTime];
}

@JsonSerializable(explicitToJson: true)
class UserGeneratedDocument extends GeneratedDocument {
  final UserInfo author;

  const UserGeneratedDocument(
      {required id, required this.author, required DateTime creationTime})
      : super(id: id, creationTime: creationTime);

  @override
  Map<String, dynamic> toJson() => _$UserGeneratedDocumentToJson(this);

  factory UserGeneratedDocument.fromJson(Map<String, dynamic> map) =>
      _$UserGeneratedDocumentFromJson(map);

  factory UserGeneratedDocument.fromDoc(DocumentSnapshot document) =>
      UserGeneratedDocument.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, author, creationTime];
}
