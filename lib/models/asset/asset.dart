import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../utils.dart';

part 'image_asset.dart';
part 'video_asset.dart';

enum AssetType { video, image }

const _assetTypeEnumMap = {
  AssetType.video: 'video',
  AssetType.image: 'image',
};

enum AssetState { processing, ready }

const _assetStateEnumMap = {
  AssetState.processing: 'processing',
  AssetState.ready: 'ready',
};

class InvalidAssetTypeException implements Exception {}

class Asset extends GeneratedDocument {
  final AssetType type;
  final AssetState state;

  const Asset._(
      {required FirestoreId id,
      required DateTime creationTime,
      required this.type,
      required this.state})
      : super(id: id, creationTime: creationTime);

  @override
  JsonMap toJson() {
    if (this is VideoAsset) {
      return (this as VideoAsset).toJson();
    } else {
      throw InvalidAssetTypeException();
    }
  }

  factory Asset.fromJson(JsonMap map) {
    switch ($enumDecode(_assetTypeEnumMap, map["type"])) {
      case AssetType.video:
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
