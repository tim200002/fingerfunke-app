part of 'post.dart';

class Group extends Post {
  const Group({
    required FirestoreId id,
    required UserInfo author,
    required String title,
    required String description,
    required DateTime creationTime,
    required PostVisibility visibility,
    required String location,
    //required this.postPlace,
    required List<Asset> media,
    required List<UserInfo> participants,
  }) : super._(
            id: id,
            type: PostType.recurrent,
            author: author,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            location: location,
            media: media,
            participants: participants);

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
      "location": location,
      "media": media.map((e) => e.toJson()).toList(),
      "participants": participants.map((user) => user.toJson()).toList(),
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
      location: map["location"] as String,
      media: (map['media'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      participants: (map["participants"] as List<dynamic>)
          .map((participant) =>
              UserInfo.fromJson(participant as Map<String, dynamic>))
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
    required String location,
    //required GeoHash postPlace,
    required List<Asset> media,
  }) =>
      Group(
        id: const Uuid().v4(),
        author: author,
        title: title,
        description: description,
        creationTime: DateTime.now(),
        visibility: visibility,
        location: location,
        media: media,
        participants: [author],
      );

  @override
  List<Object> get props => [
        ...super.props,
      ];
}
