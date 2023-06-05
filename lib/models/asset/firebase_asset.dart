part of 'asset.dart';

enum MediaType { image, pdf }

const _mediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.pdf: 'pdf',
};

class FirebaseAsset extends Asset {
  final String path;
  final MediaType mediaType;
  final Link? downloadUrl;

  const FirebaseAsset(
      {required FirestoreId id,
      required DateTime creationTime,
      required this.path,
      required this.mediaType,
      this.downloadUrl,
      required AssetState state})
      : super._(
            id: id,
            creationTime: creationTime,
            state: state,
            type: AssetType.firebaseAsset);

  @override
  JsonMap toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "path": path,
      "downloadUrl": downloadUrl,
      "state": _assetStateEnumMap[state],
      "type": _assetTypeEnumMap[AssetType.firebaseAsset],
      "mediaType": _mediaTypeEnumMap[mediaType],
    };
  }

  factory FirebaseAsset.fromJson(JsonMap map) {
    return FirebaseAsset(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      path: map["path"] as String,
      downloadUrl: map["downloadUrl"] as String?,
      state: $enumDecode(_assetStateEnumMap, map["state"]),
      mediaType: $enumDecode(_mediaTypeEnumMap, map["mediaType"]),
    );
  }

  factory FirebaseAsset.fromDoc(DocumentSnapshot document) =>
      FirebaseAsset.fromJson(documentSnaphsotToJson(document));

  factory FirebaseAsset.createWithId(
          {required String path,
          required String downloadUrl,
          required AssetState state,
          required MediaType mediaType}) =>
      FirebaseAsset(
          id: const Uuid().v4(),
          creationTime: DateTime.now(),
          mediaType: mediaType,
          path: path,
          downloadUrl: downloadUrl,
          state: state);

  static MediaType inferMediaTypeFromFile(File file) {
    final mimeType = lookupMimeType(file.path);
    if (mimeType == null) {
      throw Exception('Unsupported media type');
    }

    if (mimeType.startsWith('image/')) {
      return MediaType.image;
    } else if (mimeType.endsWith('application/pdf')) {
      return MediaType.pdf;
    } else {
      throw Exception('Unsupported media type');
    }
  }

  FirebaseAsset copyWith({
    FirestoreId? id,
    DateTime? creationTime,
    String? path,
    Link? downloadUrl,
    AssetState? state,
    MediaType? mediaType,
  }) {
    return FirebaseAsset(
      id: id ?? this.id,
      creationTime: creationTime ?? this.creationTime,
      path: path ?? this.path,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      state: state ?? this.state,
      mediaType: mediaType ?? this.mediaType,
    );
  }
}
