import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'event.dart';
part 'group.dart';

enum post_type { event, recurrent }
const _postTypeEnumMap = {
  post_type.event: 'event',
  post_type.recurrent: 'recurrent',
};

enum post_visibility { visible, hidden }
const _postVisibilityEnumMap = {
  post_visibility.visible: 'visible',
  post_visibility.hidden: 'hidden',
};

class InvalidPostTypeException implements Exception {}

class Post extends UserGeneratedDocument {
  final post_type type;

  final String title;
  final String description;

  final post_visibility visibility;

  final String location;
  //final GeoHash postPlace;

  //final List<FirestoreId> interstedUserIds;
  //final List<UserInfo> interstedUsers;

  final List<Asset> media;

  const Post._(
      {required FirestoreId id,
      required this.type,
      required UserInfo author,
      required this.title,
      required this.description,
      required DateTime creationTime,
      required this.visibility,
      required this.location,
      //required this.postPlace,
      required this.media})
      : super(id: id, author: author, creationTime: creationTime);

  @override
  Map<String, dynamic> toJson() {
    if (this is Group) {
      return (this as Group).toJson();
    } else if (this is Event) {
      return (this as Event).toJson();
    } else {
      throw InvalidPostTypeException();
    }
  }

  factory Post.fromJson(Map<String, dynamic> map) {
    switch ($enumDecode(_postTypeEnumMap, map["type"])) {
      case post_type.event:
        {
          return Event.fromJson(map);
        }
      case post_type.recurrent:
        {
          return Group.fromJson(map);
        }
      default:
        {
          throw InvalidPostTypeException();
        }
    }
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
          location,
          // postPlace,
          media
        ];
  
  }

  
