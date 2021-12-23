// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseDocument _$DatabaseDocumentFromJson(Map<String, dynamic> json) =>
    DatabaseDocument(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DatabaseDocumentToJson(DatabaseDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GeneratedDocument _$GeneratedDocumentFromJson(Map<String, dynamic> json) =>
    GeneratedDocument(
      id: json['id'],
      creationTime: dateFromJson(json['creationTime'] as int),
    );

Map<String, dynamic> _$GeneratedDocumentToJson(GeneratedDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationTime': dateToJson(instance.creationTime),
    };

UserGeneratedDocument _$UserGeneratedDocumentFromJson(
        Map<String, dynamic> json) =>
    UserGeneratedDocument(
      id: json['id'],
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      creationTime: dateFromJson(json['creationTime'] as int),
    );

Map<String, dynamic> _$UserGeneratedDocumentToJson(
        UserGeneratedDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationTime': dateToJson(instance.creationTime),
      'author': instance.author.toJson(),
    };
