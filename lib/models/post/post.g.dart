// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      type: $enumDecode(_$post_typeEnumMap, json['type']),
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      creationTime: dateFromJson(json['creationTime'] as int),
      visibility: $enumDecode(_$post_visibilityEnumMap, json['visibility']),
      location: json['location'] as String,
      media: (json['media'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author.toJson(),
      'creationTime': dateToJson(instance.creationTime),
      'type': _$post_typeEnumMap[instance.type],
      'title': instance.title,
      'description': instance.description,
      'visibility': _$post_visibilityEnumMap[instance.visibility],
      'location': instance.location,
      'media': instance.media,
    };

const _$post_typeEnumMap = {
  post_type.event: 'event',
  post_type.recurrent: 'recurrent',
};

const _$post_visibilityEnumMap = {
  post_visibility.visible: 'visible',
  post_visibility.hidden: 'hidden',
};
