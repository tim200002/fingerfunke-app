import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/json_tools.dart';
import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../utils.dart';

class UserInfo extends DatabaseDocument {
  final String name;
  final String? picture;

  const UserInfo({
    required FirestoreId id,
    required this.name,
    this.picture,
  }) : super(id: id);

  @override
  int get hashCode => toJson().hashCode;
  @override
  bool operator ==(Object other) => super.hashCode == hashCode;

  @override
  JsonMap toJson() => <String, dynamic>{
        "id": id,
        "name": name,
        "picture": picture,
      };

  factory UserInfo.fromJson(JsonMap map) => UserInfo(
        id: map['id'] as String,
        name: map['name'] as String,
        picture: map['picture'] as String?,
      );

  factory UserInfo.fromDoc(DocumentSnapshot document) =>
      UserInfo.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture];
}

enum UserClearance {
  unauthenticated(0, "none", Colors.grey),
  user(1, "user", Colors.blueGrey),
  moderation(3, "mod", Colors.orange),
  development(5, "dev", Colors.teal),
  administrator(7, "admin", Colors.deepPurple);

  final int level;
  final String label;
  final MaterialColor color;

  const UserClearance(this.level, this.label, this.color);
}

class User extends DatabaseDocument {
  final String name;
  final String? picture;
  final int? age;
  final UserClearance? clearance;
  final List<FirestoreId> savedPosts;
  final String? fcmToken;
  final Map<String, String> socialMedia;

  const User(
      {required FirestoreId id,
      required this.name,
      this.picture,
      this.savedPosts = const [],
      this.age,
      this.clearance = UserClearance.user,
      this.socialMedia = const {},
      this.fcmToken})
      : super(id: id);

  UserInfo toInfo() => UserInfo(id: id, name: name, picture: picture);

  hasClearance(UserClearance c) {
    return clearance != null ? clearance!.level >= c.level : false;
  }

  @override
  JsonMap toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'picture': picture,
        'savedPosts': savedPosts,
        'age': age,
        'clearance': clearance?.level,
        'socialMedia': socialMedia,
        'fcmToken': fcmToken
      };

  factory User.fromJson(JsonMap map) => User(
      id: map['id'] as String,
      name: map['name'] as String,
      picture: map['picture'] as String?,
      savedPosts: map['savedPosts'] != null
          ? (map['savedPosts'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          : [],
      age: JsonTools.nullable<int>(map, "age"),
      socialMedia:
          JsonTools.nullable<Map<String, String>>(map, "socialMedia") ?? {},
      clearance: UserClearance.values.firstWhere(
          (e) => e.level >= (JsonTools.nullable<int>(map, "clearance") ?? 0)),
      fcmToken: JsonTools.nullable<String>(map, "fcmToken"));

  factory User.fromDoc(DocumentSnapshot document) =>
      User.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture, age, savedPosts, clearance];
}
