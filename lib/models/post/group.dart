part of 'post.dart';

class Group extends Post {
  const Group({
    required FirestoreId id,
    required FirestoreId authorId,
    required String title,
    required String description,
    required DateTime creationTime,
    required PostVisibility visibility,
    required Place place,
    required Map<String, List<String>> geohashesByRadius,
    required Asset mainAsset,
    required List<FirestoreId> members,
  }) : super._(
            id: id,
            type: PostType.recurrent,
            authorId: authorId,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            place: place,
            geohashesByRadius: geohashesByRadius,
            mainAsset: mainAsset,
            members: members);



  @override
  JsonMap toJson() => {
        "id": id,
        "creationTime": dateToJson(creationTime),
        "author": authorId,
        "type": PostType.recurrent,
        "title": title,
        "description": description,
        "visibility": visibility.name,
        "place": place.toJson(),
        "geohashesByRadius": geohashesByRadius,
        "mainAsset": mainAsset.toJson(),
        "members": members
      };

  factory Group.fromJson(JsonMap map) => Group(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      authorId: map["authorId"],
      title: map["title"] as String,
      description: map["description"] as String,
      visibility:
          PostVisibility.values.firstWhere((t) => t.name == map["visibility"]),
      place: Place.fromJson(map["place"]),
      geohashesByRadius: map["geohashesByRadius"],
      mainAsset: Asset.fromJson(map["mainAsset"]),
      members: map["members"] as List<FirestoreId>);

  factory Group.fromDoc(DocumentSnapshot document) =>
      Group.fromJson(documentSnaphsotToJson(document));

  factory Group.createWithId({
    required FirestoreId authorId,
    required String title,
    required String description,
    required PostVisibility visibility,
    required Place place,
    required Asset mainAsset,
    required List<FirestoreId> members,
  })  {
    final GeoHasher geoHasher = GeoHasher();
    final Map<String, List<String>> geohashMap = {};
    for (final int radius in AppConfig.locationQueryRadiusLevel) {
      final List<String> geohashesForRadius =
          geoHasher.getGeohashesWithinRadius(place.position.longitude,
              place.position.latitude, (radius * 1000).toDouble(),
              precision: AppConfig.defaultGeoHashPrecision);
      geohashMap[radius.toString()] = geohashesForRadius;
    }

    return Group(
      id: const Uuid().v4(),
      authorId: authorId,
      title: title,
      description: description,
      creationTime: DateTime.now(),
      visibility: visibility,
      place: place,
      geohashesByRadius: geohashMap,
      mainAsset: mainAsset,
      members: members
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
      ];
}
