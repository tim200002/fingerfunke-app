part of 'post.dart';

class Event extends Post {
  final DateTime startTime;

  const Event(
      {required FirestoreId id,
      required UserInfo author,
      required String title,
      required String description,
      required DateTime creationTime,
      required PostVisibility visibility,
      required PostPlace place,
      required List<Asset> media,
      required this.startTime})
      : super._(
            id: id,
            type: PostType.event,
            author: author,
            title: title,
            description: description,
            creationTime: creationTime,
            visibility: visibility,
            place: place,
            media: media);

  bool get isCompleted => DateTime.now().isAfter(startTime);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationTime": dateToJson(creationTime),
      "author": author.toJson(),
      "type": "event", //_postTypeEnumMap[type],
      "title": title,
      "description": description,
      "visibility": visibility.name,
      "place": place.toJson(),
      "media": media.map((e) => e.toJson()).toList(),
      "startTime": dateToJson(startTime)
    };
  }

  factory Event.fromJson(Map<String, dynamic> map) {
    return Event(
      id: map["id"] as String,
      creationTime: dateFromJson(map['creationTime'] as int),
      author: UserInfo.fromJson(map["author"]),
      title: map["title"] as String,
      description: map["description"] as String,
      visibility:
          PostVisibility.values.firstWhere((t) => t.name == map["visibility"]),
      place: PostPlace.fromJson(map["place"]),
      media: (map['media'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: dateFromJson(map['startTime'] as int),
    );
  }

  factory Event.fromDoc(DocumentSnapshot document) =>
      Event.fromJson(documentSnaphsotToJson(document));

  factory Event.createWithId(
          {required UserInfo author,
          required String title,
          required String description,
          required PostVisibility visibility,
          required PostPlace place,
          required List<Asset> media,
          required DateTime startTime}) =>
      Event(
          id: const Uuid().v4(),
          author: author,
          title: title,
          description: description,
          creationTime: DateTime.now(),
          visibility: visibility,
          place: place,
          media: media,
          startTime: startTime);

  @override
  List<Object> get props => [...super.props, startTime];
}
