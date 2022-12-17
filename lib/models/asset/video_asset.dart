part of 'asset.dart';

class VideoAsset extends Asset {
  final String? assetId;
  final String? playbackId;
  const VideoAsset(
      {required FirestoreId id,
      required DateTime creationTime,
      this.assetId,
      this.playbackId,
      required AssetState state})
      : super._(
            id: id,
            creationTime: creationTime,
            state: state,
            type: AssetType.video);

  @override
  JsonMap toJson() => {
        "id": id,
        "creationTime": dateToJson(creationTime),
        "assetId": assetId,
        "playbackId": playbackId,
        "state": _assetStateEnumMap[state],
        "type": _assetTypeEnumMap[AssetType.video]
      };

  factory VideoAsset.fromJson(JsonMap map) => VideoAsset(
        id: map["id"] as String,
        creationTime: dateFromJson(map['creationTime'] as int),
        assetId: map["assetId"] as String?,
        playbackId: map["playbackId"] as String?,
        state: $enumDecode(_assetStateEnumMap, map["state"]),
      );

  factory VideoAsset.fromDoc(DocumentSnapshot document) =>
      VideoAsset.fromJson(documentSnaphsotToJson(document));
}
