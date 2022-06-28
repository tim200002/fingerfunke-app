import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:uuid/uuid.dart';

part 'image_asset.dart';
part 'video_asset.dart';

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

class Asset extends GeneratedDocument {
  final asset_type type;
  final asset_state state;

  const Asset._(
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
