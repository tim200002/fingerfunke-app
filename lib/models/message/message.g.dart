// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String,
  type: $enumDecode(_$message_typeEnumMap, json['type']),
  author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
  creationTime: dateFromJson(json['creationTime'] as int),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author.toJson(),
  'creationTime': dateToJson(instance.creationTime),
  'type': _$message_typeEnumMap[instance.type],
};

const _$message_typeEnumMap = {
  message_type.video: 'video',
  message_type.text: 'text',
};

VideoMessage _$VideoMessageFromJson(Map<String, dynamic> json) => VideoMessage(
      id: json['id'] as String,
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      creationTime: dateFromJson(json['creationTime'] as int),
      video: json['video'] as String,
    );

Map<String, dynamic> _$VideoMessageToJson(VideoMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationTime': dateToJson(instance.creationTime),
      'author': instance.author.toJson(),
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
      'creationTime': dateToJson(instance.creationTime),
      'author': instance.author.toJson(),
      'text': instance.text,
    };
