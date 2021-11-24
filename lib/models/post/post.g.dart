// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostWithoutId _$PostWithoutIdFromJson(Map<String, dynamic> json) =>
    PostWithoutId(
      type: $enumDecode(_$post_typeEnumMap, json['type']),
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      creationTime: json['creationTime'] as int,
      visibility: $enumDecode(_$post_visibilityEnumMap, json['visibility']),
      location: json['location'] as String,
      postPlace: json['postPlace'] as String,
      media: (json['media'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostWithoutIdToJson(PostWithoutId instance) =>
    <String, dynamic>{
      'type': _$post_typeEnumMap[instance.type],
      'author': instance.author.toJson(),
      'title': instance.title,
      'description': instance.description,
      'creationTime': instance.creationTime,
      'visibility': _$post_visibilityEnumMap[instance.visibility],
      'location': instance.location,
      'postPlace': instance.postPlace,
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

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      type: $enumDecode(_$post_typeEnumMap, json['type']),
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      creationTime: json['creationTime'] as int,
      visibility: $enumDecode(_$post_visibilityEnumMap, json['visibility']),
      location: json['location'] as String,
      postPlace: json['postPlace'] as String,
      media: (json['media'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$post_typeEnumMap[instance.type],
      'author': instance.author.toJson(),
      'title': instance.title,
      'description': instance.description,
      'creationTime': instance.creationTime,
      'visibility': _$post_visibilityEnumMap[instance.visibility],
      'location': instance.location,
      'postPlace': instance.postPlace,
      'media': instance.media,
    };
