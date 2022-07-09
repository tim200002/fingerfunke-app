import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class UserInfo extends DatabaseDocument {
  final String name;
  final String? picture;

  const UserInfo({
    required FirestoreId id,
    required this.name,
    this.picture,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'picture': picture,
      };

  factory UserInfo.fromJson(Map<String, dynamic> map) => UserInfo(
        id: map['id'] as String,
        name: map['name'] as String,
        picture: map['picture'] as String?,
      );

  factory UserInfo.fromDoc(DocumentSnapshot document) =>
      UserInfo.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture];
}

typedef ClearanceLevel = int;


class User extends UserInfo {
  static const ClearanceLevel clearanceUser = 1;
  static const ClearanceLevel clearanceAdmin = 7;

  final int? age;
  final int? clearance;
  final List<FirestoreId> savedPosts;

  const User({
    required FirestoreId id,
    required String name,
    String? picture,
    this.savedPosts = const [],
    this.age,
    this.clearance = 0,
  }) : super(id: id, name: name, picture: picture);

  hasClearance(ClearanceLevel level) {
    return clearance != null ? clearance! >= level : false;
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'picture': picture,
        'savedPosts': savedPosts,
        'age': age,
        'clearance': clearance
      };

  factory User.fromJson(Map<String, dynamic> map) => User(
      id: map['id'] as String,
      name: map['name'] as String,
      picture: map['picture'] as String?,
      savedPosts: map['savedPosts'] != null
          ? (map['savedPosts'] as List<dynamic>).map((e) => e as String).toList()
          : [],
      age: map['age'] as int?,
      clearance: map['clearance'] as int?);

  factory User.fromDoc(DocumentSnapshot document) =>
      User.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture, age, savedPosts, clearance];
}
