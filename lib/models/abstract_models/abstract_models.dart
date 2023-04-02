import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/type_aliases.dart';
import '../utils.dart';

part 'abstract_models.g.dart';

abstract class Serializable {
  const Serializable();
  JsonMap toJson();

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) => other.toString() == toString();

  @override
  int get hashCode => toJson().hashCode;
}

@JsonSerializable(explicitToJson: true)
class DatabaseDocument extends Equatable implements Serializable {
  final FirestoreId id;

  const DatabaseDocument({required this.id});

  @override
  JsonMap toJson() => _$DatabaseDocumentToJson(this);

  factory DatabaseDocument.fromJson(JsonMap map) =>
      _$DatabaseDocumentFromJson(map);

  factory DatabaseDocument.fromDoc(DocumentSnapshot document) {
    return DatabaseDocument.fromJson(documentSnaphsotToJson(document));
  }

  @override
  List<Object?> get props => [id];
}

@JsonSerializable(explicitToJson: true)
class GeneratedDocument extends DatabaseDocument {
  @JsonKey(toJson: dateToJson, fromJson: dateFromJson)
  final DateTime creationTime;

  const GeneratedDocument({required id, required this.creationTime})
      : super(id: id);

  @override
  JsonMap toJson() => _$GeneratedDocumentToJson(this);

  factory GeneratedDocument.fromJson(JsonMap map) =>
      _$GeneratedDocumentFromJson(map);

  factory GeneratedDocument.fromDoc(DocumentSnapshot document) =>
      GeneratedDocument.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, creationTime];
}

@JsonSerializable(explicitToJson: true)
class UserGeneratedDocument extends GeneratedDocument {
  final FirestoreId authorId;

  const UserGeneratedDocument(
      {required id, required this.authorId, required DateTime creationTime})
      : super(id: id, creationTime: creationTime);

  @override
  JsonMap toJson() => _$UserGeneratedDocumentToJson(this);

  factory UserGeneratedDocument.fromJson(JsonMap map) =>
      _$UserGeneratedDocumentFromJson(map);

  factory UserGeneratedDocument.fromDoc(DocumentSnapshot document) =>
      UserGeneratedDocument.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, authorId, creationTime];
}
