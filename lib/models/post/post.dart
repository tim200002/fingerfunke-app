import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

enum post_type { event, recurrent }
enum post_visibility { visible, hidden }

class Post extends DatabaseDocument {
  final post_type type;

  final UserInfo author;
  final String title;
  final String description;
  final UnixMs creationTime;
  final post_visibility visibility;

  final String location;
  final GeoHash postPlace;

  final List<Link> media;

  const Post(
      {required FirestoreId id,
      required this.type,
      required this.author,
      required this.title,
      required this.description,
      required this.creationTime,
      required this.visibility,
      required this.location,
      required this.postPlace,
      required this.media})
      : super(id: id);

  @override
  Map<String, dynamic> toMap({bool includeId = false}) {
    return {
      ...super.toMap(),
      'type': Tools.enumToString(type),
      'author': author.toMap(includeId: true),
      'title': title,
      'description': description,
      'creationTime': creationTime,
      'visibility': Tools.enumToString(visibility),
      'location': location,
      'postPlace': postPlace,
      'media': media
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      type: Tools.stringToEnum(map['type'], post_type.values),
      author: UserInfo.fromMap(map['author']),
      title: map['title'],
      description: map['description'],
      creationTime: map['creationTime'],
      visibility: Tools.stringToEnum(map['visibility'], post_visibility.values),
      location: map['location'],
      postPlace: map['postPlace'],
      media: Tools.jsonListToList(map["media"]) ?? [],
    );
  }

  factory Post.fromDoc(DocumentSnapshot document) =>
      Post.fromMap(docToMap(document));

  @override
  List<Object> get props => [
        id,
        type,
        author,
        title,
        description,
        creationTime,
        visibility,
        location,
        postPlace,
        media
      ];
}

class PostWithoutId {
  final post_type type;

  final UserInfo author;
  final String title;
  final String description;
  final UnixMs creationTime;
  final post_visibility visibility;

  final String location;
  final GeoHash postPlace;

  final List<Link> media;

  const PostWithoutId(
      {required this.type,
      required this.author,
      required this.title,
      required this.description,
      required this.creationTime,
      required this.visibility,
      required this.location,
      required this.postPlace,
      required this.media});

  Map<String, dynamic> toMap() {
    return {
      'type': Tools.enumToString(type),
      'author': author.toMap(includeId: true),
      'title': title,
      'description': description,
      'creationTime': creationTime,
      'visibility': Tools.enumToString(visibility),
      'location': location,
      'postPlace': postPlace,
      'media': media
    };
  }
}
