// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoMessage _$VideoMessageFromJson(Map<String, dynamic> json) => VideoMessage(
      id: json['id'] as String,
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      creationTime: dateFromJson(json['creationTime'] as int),
      video: json['video'] as String,
    );

Map<String, dynamic> _$VideoMessageToJson(VideoMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author.toJson(),
      'creationTime': dateToJson(instance.creationTime),
      'video': instance.video,
    };

TextMessage _$TextMessageFromJson(Map<String, dynamic> json) => TextMessage(
      id: json['id'] as String,
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      creationTime: dateFromJson(json['creationTime'] as int),
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextMessageToJson(TextMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author.toJson(),
      'creationTime': dateToJson(instance.creationTime),
      'text': instance.text,
    };
