import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:uuid/uuid.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../asset/asset.dart';
import '../user/user.dart';
import '../utils.dart';

part 'event.dart';
part 'group.dart';

class PostPlace {
  final String address;
  final String geohash;
  final GeoPoint point;

  const PostPlace({
    required this.address,
    required this.geohash,
    required this.point,
  });

  const PostPlace.demo()
      : this(address: "null", geohash: "abcd", point: const GeoPoint(0, 0));

  PostPlace.fromPick(PickResult r)
      : this(
            address: r.formattedAddress!,
            point: GeoPoint(r.geometry!.location.lat, r.geometry!.location.lat),
            geohash: Geoflutterfire()
                .point(
                    latitude: r.geometry!.location.lat,
                    longitude: r.geometry!.location.lng)
                .hash);

  factory PostPlace.fromJson(Map<String, dynamic> map) => PostPlace(
        address: map["address"],
        geohash: map["geohash"],
        point: map["geopoint"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "geohash": geohash,
        "geopoint": point,
      };
}

enum PostType { event, recurrent }

enum PostVisibility { visible, hidden }

class InvalidPostTypeException implements Exception {}

class Post extends UserGeneratedDocument {
  final PostType type;
  final String title;
  final String description;
  final PostVisibility visibility;
  final PostPlace place;

  //final List<FirestoreId> interstedUserIds;
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
      required this.media})
      : super(id: id, author: author, creationTime: creationTime);

  int get hashCode => toJson().hashCode;

  bool get isEvent => type == PostType.event;
  bool get isGroup => type == PostType.recurrent;

  Event? get asEvent => isEvent ? (this as Event) : null;
  Group? get asGroup => isGroup ? (this as Group) : null;

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
        media
      ];
}
