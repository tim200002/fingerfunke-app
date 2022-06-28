part of 'asset.dart';

class ImageAsset extends Asset {
  final Link downloadUrl;

  const ImageAsset(
      {required FirestoreId id,
      required DateTime creationTime,
      required this.downloadUrl,
      required asset_state state})
      : super._(
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

  factory ImageAsset.createWithId(
          {required String downloadUrl, required asset_state state}) =>
      ImageAsset(
          id: const Uuid().v4(),
          creationTime: DateTime.now(),
          downloadUrl: downloadUrl,
          state: state);
}
