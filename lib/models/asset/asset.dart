import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'asset.g.dart';

enum asset_type { video, image }

enum asset_state { processing, ready }

@JsonSerializable(explicitToJson: true)
class Asset extends UserGeneratedDocument {
  final asset_type type;
  final asset_state state;
  

  const Asset(
      {required FirestoreId id,
      required UserInfo author,
      required DateTime creationTime,
      required this.type,
      required this.state})
      : super(id: id, author: author, creationTime: creationTime);

  @override
  Map<String, dynamic> toJson() => _$AssetToJson(this);

  factory Asset.fromJson(Map<String, dynamic> map) => _$AssetFromJson(map);

  factory Asset.fromDoc(DocumentSnapshot document) =>
      Asset.fromJson(documentSnaphsotToJson(document));
}

@JsonSerializable(explicitToJson: true)
class VideoAsset extends Asset {
  final String? assetId;
  const VideoAsset(
      {required FirestoreId id,
      required UserInfo author,
      required DateTime creationTime,
      required this.assetId,
      required asset_state state})
      : super(
            id: id,
            author: author,
            creationTime: creationTime,
            state: state,
            type: asset_type.video);

  @override
  Map<String, dynamic> toJson() => _$VideoAssetToJson(this);

  factory VideoAsset.fromJson(Map<String, dynamic> map) => _$VideoAssetFromJson(map);

  factory VideoAsset.fromDoc(DocumentSnapshot document) =>
      VideoAsset.fromJson(documentSnaphsotToJson(document));
}
