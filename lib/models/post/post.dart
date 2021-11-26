import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'post.g.dart';

enum post_type { event, recurrent }
enum post_visibility { visible, hidden }

@JsonSerializable(explicitToJson: true)
class Post extends UserGeneratedDocument {
  final post_type type;

  final String title;
  final String description;

  @JsonKey(toJson: dateToJson, fromJson: dateFromJson)
  final DateTime creationTime;
  final post_visibility visibility;

  final String location;
  //final GeoHash postPlace;

  final List<Link> media;

  const Post(
      {required FirestoreId id,
      required this.type,
      required UserInfo author,
      required this.title,
      required this.description,
      required this.creationTime,
      required this.visibility,
      required this.location,
      //required this.postPlace,
      required this.media})
      : super(id: id, author: author);

  @override
  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromJson(Map<String, dynamic> map) => _$PostFromJson(map);

  factory Post.fromDoc(DocumentSnapshot document) =>
      Post.fromJson(documentSnaphsotToJson(document));

  factory Post.createWithId(
          {required post_type type,
          required UserInfo author,
          required String title,
          required String description,
          required DateTime creationTime,
          required post_visibility visibility,
          required String location,
          //required GeoHash postPlace,
          required List<Link> media}) =>
      Post(
          id: const Uuid().v4(),
          type: type,
          author: author,
          title: title,
          description: description,
          creationTime: creationTime,
          visibility: visibility,
          location: location,
          media: media);

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
