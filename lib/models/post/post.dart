import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:uuid/uuid.dart';

import '../../utils/app_config.dart';
import '../../utils/type_aliases.dart';
import '../../utils/utility_classes/geohash.dart';
import '../abstract_models/abstract_models.dart';
import '../asset/asset.dart';
import '../place.dart';
import '../user/user.dart';
import '../utils.dart';

part 'event.dart';
part 'group.dart';

enum PostType { event, recurrent }

enum PostVisibility { visible, hidden }

class InvalidPostTypeException implements Exception {}

class Post extends UserGeneratedDocument {
  final PostType type;
  final String title;
  final String description;
  final PostVisibility visibility;
  final Place place;
  final Map<String, List<String>> geohashesByRadius;

  final List<FirestoreId> members;
  //final List<UserInfo> interstedUsers;

  final List<Asset> media;

  //final List<UserInfo> participants;

  const Post._(
      {required FirestoreId id,
      required this.type,
      required UserInfo author,
      required this.title,
      required this.description,
      required DateTime creationTime,
      required this.visibility,
      required this.place,
      required this.geohashesByRadius,
      required this.media,
      required this.members})
      : super(id: id, author: author, creationTime: creationTime);

  bool get isEvent => type == PostType.event;
  bool get isGroup => type == PostType.recurrent;

  Event? get asEvent => isEvent ? (this as Event) : null;
  Group? get asGroup => isGroup ? (this as Group) : null;

  @override
  JsonMap toJson() {
    if (this is Group) {
      return (this as Group).toJson();
    } else if (this is Event) {
      return (this as Event).toJson();
    } else {
      throw InvalidPostTypeException();
    }
  }

  factory Post.fromJson(JsonMap map) {
    switch (PostType.values.firstWhere((t) => t.name == map["type"])) {
      case PostType.event:
        return Event.fromJson(map);
      case PostType.recurrent:
        return Group.fromJson(map);
      default:
        throw InvalidPostTypeException();
    }
  }

  bool isUserAuthor(UserInfo? user) {
    if (user == null) return false;
    return author.id == user.id;
  }

  bool isAuthor(FirestoreId? userId) {
    return author.id == userId;
  }

  factory Post.fromDoc(DocumentSnapshot document) =>
      Post.fromJson(documentSnaphsotToJson(document));
  @override
  List<Object> get props => [
        id,
        type,
        author,
        title,
        description,
        creationTime,
        visibility,
        place,
        media,
        members
      ];
}
