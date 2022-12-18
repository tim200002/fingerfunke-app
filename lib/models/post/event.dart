part of 'post.dart';

class Event extends Post {
  final DateTime startTime;


  const Event({
    required FirestoreId id,
    required UserInfo author,
    required String title,
    required String description,
    required DateTime creationTime,
    required PostVisibility visibility,
    required PostPlace place,
    required Map<String, List<String>> geohashesByRadius,
    required List<Asset> media,
    required this.startTime,
    required List<FirestoreId> members,
  }) : super._(
            id: id,
            type: PostType.event,
            author: author,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            place: place,
            media: media,
             geohashesByRadius: geohashesByRadius,
            members: members);

  bool get isCompleted => DateTime.now().isAfter(startTime);

  @override
  JsonMap toJson() => {
        "id": id,
        "creationTime": dateToJson(creationTime),
        "author": author.toJson(),
        "type": "event", //_postTypeEnumMap[type],
        "title": title,
        "description": description,
        "visibility": visibility.name,
        "place": place.toJson(),
        "geohashesByRadius": geohashesByRadius,
        "media": media.map((e) => e.toJson()).toList(),
        "startTime": dateToJson(startTime),
        "members": members
      };

  factory Event.fromJson(JsonMap map) => Event(

      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      author: UserInfo.fromJson(map["author"]),
      title: map["title"] as String,
      description: map["description"] as String,
      visibility:
          PostVisibility.values.firstWhere((t) => t.name == map["visibility"]),
      place: PostPlace.fromJson(map["place"]),
      geohashesByRadius: map["geohashesByRadius"] == null
      ? {}
      : (map["geohashesByRadius"] as JsonMap).map((key, value) =>
          MapEntry(key,
              (value as List<dynamic>).map((e) => e as String).toList())),
      media: (map['media'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as JsonMap))
          .toList(),
      startTime: dateFromJson(map['startTime'] as int),
      members: (map["members"] as List).map((e) => e.toString()).toList());


  factory Event.fromDoc(DocumentSnapshot document) =>
      Event.fromJson(documentSnaphsotToJson(document));


  factory Event.createWithId(
      {required UserInfo author,
      required String title,
      required String description,
      required PostVisibility visibility,
      required PostPlace place,
      required List<Asset> media,
      required DateTime startTime,
      required List<FirestoreId> members}) {
    final GeoHasher geoHasher = GeoHasher();
    final Map<String, List<String>> geohashMap = {};
    for (final int radius in AppConfig.locationQueryRadiusLevel) {
      final List<String> geohashesForRadius =
          geoHasher.getGeohashesWithinRadius(place.point.longitude,
              place.point.latitude, (radius * 1000).toDouble(),
              precision: AppConfig.defaultGeoHashPrecision);
      geohashMap[radius.toString()] = geohashesForRadius;
    }

    return Event(
        id: const Uuid().v4(),
        author: author,
        title: title,
        description: description,
        creationTime: DateTime.now(),
        visibility: visibility,
        place: place,
        geohashesByRadius: geohashMap,
        media: media,
        startTime: startTime,
        members: members);
  }
  @override
  List<Object> get props => [...super.props, startTime];
}
