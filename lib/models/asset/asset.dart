import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

enum asset_type { video, image }
const _assetTypeEnumMap = {
  asset_type.video: 'video',
  asset_type.image: 'image',
};

enum asset_state { processing, ready }
const _assetStateEnumMap = {
  asset_state.processing: 'processing',
  asset_state.ready: 'ready',
};

class InvalidAssetTypeException implements Exception {}

class Asset extends GeneratedDocument{
  final asset_type type;
  final asset_state state;

  const Asset(
      {required FirestoreId id,
      required DateTime creationTime,
      required this.type,
      required this.state})
      : super(id: id, creationTime: creationTime);

  @override
  Map<String, dynamic> toJson() {
    if (this is VideoAsset) {
      return (this as VideoAsset).toJson();
    } else {
      throw InvalidAssetTypeException();
    }
  }

  factory Asset.fromJson(Map<String, dynamic> map) {
    switch ($enumDecode(_assetTypeEnumMap, map["type"])) {
      case asset_type.video:
        {
          return VideoAsset.fromJson(map);
        }
      default:
        {
          throw InvalidAssetTypeException();
        }
    }
  }

  factory Asset.fromDoc(DocumentSnapshot document) =>
      Asset.fromJson(documentSnaphsotToJson(document));
}

class VideoAsset extends Asset {
  final String? assetId;
  final String? playbackId;
  const VideoAsset(
      {required FirestoreId id,
      required DateTime creationTime,
      this.assetId,
      this.playbackId,
      required asset_state state})
      : super(
            id: id,
            creationTime: creationTime,
            state: state,
            type: asset_type.video);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "assetId": assetId,
      "playbackId": playbackId,
      "state": _assetStateEnumMap[state],
      "type": _assetTypeEnumMap[asset_type.video]
    };
  }

  factory VideoAsset.fromJson(Map<String, dynamic> map) {
    return VideoAsset(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      assetId: map["assetId"] as String?,
      playbackId: map["playbackId"] as String?,
      state: $enumDecode(_assetStateEnumMap, map["state"]),
    );
  }

  factory VideoAsset.fromDoc(DocumentSnapshot document) =>
      VideoAsset.fromJson(documentSnaphsotToJson(document));
}

class ImageAsset extends Asset {
  final Link downloadUrl;

  const ImageAsset(
      {required FirestoreId id,
      required DateTime creationTime,
      required this.downloadUrl,
      required asset_state state})
      : super(
            id: id,
            creationTime: creationTime,
            state: state,
            type: asset_type.video);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "downloadUrl": downloadUrl,
      "state": _assetStateEnumMap[state],
      "type": _assetTypeEnumMap[asset_type.video]
    };
  }

  factory ImageAsset.fromJson(Map<String, dynamic> map) {
    return ImageAsset(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      downloadUrl: map["downloadUrl"] as String,
      state: $enumDecode(_assetStateEnumMap, map["state"]),
    );
  }

  factory ImageAsset.fromDoc(DocumentSnapshot document) =>
      ImageAsset.fromJson(documentSnaphsotToJson(document));
}
