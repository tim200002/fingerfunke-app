part of 'post.dart';

class Event extends Post {
  final DateTime startTime;

  const Event({
    required FirestoreId id,
    required FirestoreId authorId,
    required String title,
    required String description,
    required DateTime creationTime,
    required PostVisibility visibility,
    required Place place,
    required Map<String, List<String>> geohashesByRadius,
    required Asset mainAsset,
    required List<Asset> media,
    required this.startTime,
    required List<FirestoreId> members,
  }) : super._(
            id: id,
            type: PostType.event,
            authorId: authorId,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            place: place,
            mainAsset: mainAsset,
            media: media,
            geohashesByRadius: geohashesByRadius,
            members: members);

  bool get isCompleted => DateTime.now().isAfter(startTime);

  @override
  JsonMap toJson() => {
        "id": id,
        "creationTime": dateToJson(creationTime),
        "authorId": authorId,
        "type": "event", //_postTypeEnumMap[type],
        "title": title,
        "description": description,
        "visibility": visibility.name,
        "place": place.toJson(),
        "geohashesByRadius": geohashesByRadius,
        "mainAsset": mainAsset.toJson(),
        "startTime": dateToJson(startTime),
        "media": media.map((e) => e.toJson()).toList(),
        "members": members
      };

  factory Event.fromJson(JsonMap map) => Event(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      authorId: map["authorId"],
      title: map["title"] as String,
      description: map["description"] as String,
      visibility:
          PostVisibility.values.firstWhere((t) => t.name == map["visibility"]),
      place: Place.fromJson(map["place"]),
      geohashesByRadius: map["geohashesByRadius"] == null
          ? {}
          : (map["geohashesByRadius"] as JsonMap).map((key, value) => MapEntry(
              key, (value as List<dynamic>).map((e) => e as String).toList())),
      mainAsset: Asset.fromJson(map["mainAsset"]),
      startTime: dateFromJson(map['startTime'] as int),
      members: (map["members"] as List).map((e) => e.toString()).toList(),
      media: (map["media"] as List).map((e) => Asset.fromJson(e)).toList());

  factory Event.fromDoc(DocumentSnapshot document) =>
      Event.fromJson(documentSnaphsotToJson(document));

  factory Event.createWithId(
      {required FirestoreId authorId,
      required String title,
      required String description,
      required PostVisibility visibility,
      required Place place,
      required Asset mainAsset,
      required List<Asset> media,
      required DateTime startTime,
      required List<FirestoreId> members}) {
    final GeoHasher geoHasher = GeoHasher();
    final Map<String, List<String>> geohashMap = {};
    for (final int radius in AppConfig.locationQueryRadiusLevel) {
      final List<String> geohashesForRadius =
          geoHasher.getGeohashesWithinRadius(place.position.longitude,
              place.position.latitude, (radius * 1000).toDouble(),
              precision: AppConfig.defaultGeoHashPrecision);
      geohashMap[radius.toString()] = geohashesForRadius;
    }

    return Event(
        id: const Uuid().v4(),
        authorId: authorId,
        title: title,
        description: description,
        creationTime: DateTime.now(),
        visibility: visibility,
        place: place,
        geohashesByRadius: geohashMap,
        mainAsset: mainAsset,
        startTime: startTime,
        members: members,
        media: media);
  }
  @override
  List<Object> get props => [...super.props, startTime];
}
