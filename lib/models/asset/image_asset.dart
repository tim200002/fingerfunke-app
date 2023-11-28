part of 'asset.dart';

class ImageAsset extends Asset {
  final Link downloadUrl;

  const ImageAsset(
      {required FirestoreId id,
      required DateTime creationTime,
      required this.downloadUrl,
      required AssetState state})
      : super._(
            id: id,
            creationTime: creationTime,
            state: state,
            type: AssetType.video);

  @override
  JsonMap toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "downloadUrl": downloadUrl,
      "state": _assetStateEnumMap[state],
      "type": _assetTypeEnumMap[AssetType.video]
    };
  }

  factory ImageAsset.fromJson(JsonMap map) {
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
          {required String downloadUrl, required AssetState state}) =>
      ImageAsset(
          id: const Uuid().v4(),
          creationTime: DateTime.now(),
          downloadUrl: downloadUrl,
          state: state);
}
