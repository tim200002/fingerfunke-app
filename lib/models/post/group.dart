part of 'post.dart';

class Group extends Post {
  const Group({
    required FirestoreId id,
    required UserInfo author,
    required String title,
    required String description,
    required DateTime creationTime,
    required PostVisibility visibility,
    required PostPlace place,
    required Map<String, List<String>> geohashesByRadius,
    required List<Asset> media,
    required List<FirestoreId> members,
  }) : super._(
            id: id,
            type: PostType.recurrent,
            author: author,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            place: place,
            geohashesByRadius: geohashesByRadius,
            media: media,
            members: members);



  @override
  JsonMap toJson() => {
        "id": id,
        "creationTime": dateToJson(creationTime),
        "author": author.toJson(),
        "type": PostType.recurrent,
        "title": title,
        "description": description,
        "visibility": visibility.name,
        "place": place.toJson(),
        "geohashesByRadius": geohashesByRadius,
        "media": media.map((e) => e.toJson()).toList(),
        "members": members
      };

  factory Group.fromJson(JsonMap map) => Group(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      author: UserInfo.fromJson(map["author"] as JsonMap),
      title: map["title"] as String,
      description: map["description"] as String,
      visibility:
          PostVisibility.values.firstWhere((t) => t.name == map["visibility"]),
      place: PostPlace.fromJson(map["place"]),
      geohashesByRadius: map["geohashesByRadius"],
      media: (map['media'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as JsonMap))
          .toList(),
      members: map["members"] as List<FirestoreId>);

  factory Group.fromDoc(DocumentSnapshot document) =>
      Group.fromJson(documentSnaphsotToJson(document));

  factory Group.createWithId({
    required UserInfo author,
    required String title,
    required String description,
    required PostVisibility visibility,
    required PostPlace place,
    required List<Asset> media,
    required List<FirestoreId> members,
  })  {
    final GeoHasher geoHasher = GeoHasher();
    final Map<String, List<String>> geohashMap = {};
    for (final int radius in AppConfig.locationQueryRadiusLevel) {
      final List<String> geohashesForRadius =
          geoHasher.getGeohashesWithinRadius(place.point.longitude,
              place.point.latitude, (radius * 1000).toDouble(),
              precision: AppConfig.defaultGeoHashPrecision);
      geohashMap[radius.toString()] = geohashesForRadius;
    }

    return Group(
      id: const Uuid().v4(),
      author: author,
      title: title,
      description: description,
      creationTime: DateTime.now(),
      visibility: visibility,
      place: place,
      geohashesByRadius: geohashMap,
      media: media,
      members: members
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
      ];
}
