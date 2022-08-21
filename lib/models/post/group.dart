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
    required List<Asset> media,
  }) : super._(
          id: id,
          type: PostType.recurrent,
          author: author,
          title: title,
          description: description,
          creationTime: creationTime,
          visibility: visibility,
          place: place,
          media: media,
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "author": author.toJson(),
      "type": PostType.recurrent,
      "title": title,
      "description": description,
      "visibility": visibility.name,
      "location": place.toJson(),
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
      visibility:
          PostVisibility.values.firstWhere((t) => t.name == map["visibility"]),
      place: PostPlace.fromJson(map["place"]),
      media: (map['media'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory Group.fromDoc(DocumentSnapshot document) =>
      Group.fromJson(documentSnaphsotToJson(document));

  factory Group.createWithId({
    required UserInfo author,
    required String title,
    required String description,
    required PostVisibility visibility,
    required PostPlace place,
    required List<Asset> media,
  }) =>
      Group(
        id: const Uuid().v4(),
        author: author,
        title: title,
        description: description,
        creationTime: DateTime.now(),
        visibility: visibility,
        place: place,
        media: media,
      );

  @override
  List<Object> get props => [
        ...super.props,
      ];
}
