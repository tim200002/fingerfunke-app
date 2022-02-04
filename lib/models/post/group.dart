part of 'post.dart';

class Group extends Post {

  const Group(
      {required FirestoreId id,
      required UserInfo author,
      required String title,
      required String description,
      required DateTime creationTime,
      required post_visibility visibility,
      required String location,
      //required this.postPlace,
      required List<Asset> media,})
      : super._(
            id: id,
            type: post_type.recurrent,
            author: author,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            location: location,
            media: media);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "author": author.toJson(),
      "type": _postTypeEnumMap[type],
      "title": title,
      "description": description,
      "visibility": _postVisibilityEnumMap[visibility],
      "location": location,
      "media": media.map((e) => e.toJson()).toList(),
    };
  }

  factory Group.fromJson(Map<String, dynamic> map) {
    return Group(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      author: UserInfo.fromJson(map["author"] as Map<String, dynamic>),
      title: map["title"] as String,
      description: map["description"] as String,
      visibility: $enumDecode(_postVisibilityEnumMap, map["visibility"]),
      location: map["location"] as String,
      media: (map['media'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  
  factory Group.fromDoc(DocumentSnapshot document) =>
      Group.fromJson(documentSnaphsotToJson(document));

  factory Group.createWithId(
      {required UserInfo author,
      required String title,
      required String description,
      required post_visibility visibility,
      required String location,
      //required GeoHash postPlace,
      required List<Asset> media,
      required DateTime startTime}) =>
  Group(
      id: const Uuid().v4(),
      author: author,
      title: title,
      description: description,
      creationTime: DateTime.now(),
      visibility: visibility,
      location: location,
      media: media);

  @override
  List<Object> get props => [
        ...super.props,
      ];
}
