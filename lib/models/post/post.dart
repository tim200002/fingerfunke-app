
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final Asset mainAsset;
  final List<Asset> media;

  //final List<UserInfo> participants;

  const Post._(
      {required FirestoreId id,
      required this.type,
      required FirestoreId authorId,
      required this.title,
      required this.description,
      required DateTime creationTime,
      required this.visibility,
      required this.place,
      required this.geohashesByRadius,
      required this.mainAsset,
      required this.members,
      required this.media})
      : super(id: id, authorId: authorId, creationTime: creationTime);

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
    return authorId == user.id;
  }

  bool isUserMember(UserInfo? user) {
    if (user == null) return false;
    return members.contains(user.id);
  }

  bool isAuthor(FirestoreId? userId) {
    return authorId == userId;
  }

  factory Post.fromDoc(DocumentSnapshot document) =>
      Post.fromJson(documentSnaphsotToJson(document));
  @override
  List<Object> get props => [
        id,
        type,
        authorId,
        title,
        description,
        creationTime,
        visibility,
        place,
        mainAsset,
        members,
        media
      ];
}
