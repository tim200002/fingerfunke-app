// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      id: json['id'] as String,
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      creationTime: dateFromJson(json['creationTime'] as int),
      type: $enumDecode(_$asset_typeEnumMap, json['type']),
      state: $enumDecode(_$asset_stateEnumMap, json['state']),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author.toJson(),
      'creationTime': dateToJson(instance.creationTime),
      'type': _$asset_typeEnumMap[instance.type],
      'state': _$asset_stateEnumMap[instance.state],
    };

const _$asset_typeEnumMap = {
  asset_type.video: 'video',
  asset_type.image: 'image',
};

const _$asset_stateEnumMap = {
  asset_state.processing: 'processing',
  asset_state.ready: 'ready',
};

VideoAsset _$VideoAssetFromJson(Map<String, dynamic> json) => VideoAsset(
      id: json['id'] as String,
      author: UserInfo.fromJson(json['author'] as Map<String, dynamic>),
      creationTime: dateFromJson(json['creationTime'] as int),
      assetId: json['assetId'] as String?,
      state: $enumDecode(_$asset_stateEnumMap, json['state']),
    );

Map<String, dynamic> _$VideoAssetToJson(VideoAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author.toJson(),
      'creationTime': dateToJson(instance.creationTime),
      'state': _$asset_stateEnumMap[instance.state],
      'assetId': instance.assetId,
    };
