import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.g.dart';

enum post_type { event, recurrent }
enum post_visibility { visible, hidden }

@JsonSerializable(explicitToJson: true)
class PostWithoutId extends Equatable {
  final post_type type;
  final UserInfo author;
  final String title;
  final String description;
  final UnixMs creationTime;
  final post_visibility visibility;

  final String location;
  final GeoHash postPlace;

  final List<Link> media;

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        creationTime,
        visibility,
        location,
        postPlace,
        media
      ];

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

  Map<String, dynamic> toJson() => _$PostWithoutIdToJson(this);
}

@JsonSerializable(explicitToJson: true)
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
  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromJson(Map<String, dynamic> map) => _$PostFromJson(map);

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
        postPlace,
        media
      ];
}
