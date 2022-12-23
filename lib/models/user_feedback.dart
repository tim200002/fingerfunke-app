import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../utils/type_aliases.dart';
import 'abstract_models/abstract_models.dart';
import 'user/user.dart';
import 'utils.dart';

enum UserFeedbackCategories {
  bug("Technisches Problem"),
  content("Inhalte"),
  organization("Entwicklungsteam"),
  compliment("Lob"),
  other("sonstiges");

  final String label;
  const UserFeedbackCategories(this.label);
}

enum UserFeedbackState {
  open(Colors.red),
  closed(Colors.teal);

  final MaterialColor color;

  const UserFeedbackState(this.color);
}

class UserFeedback extends UserGeneratedDocument {
  final String title;
  final String description;
  final List<UserFeedbackCategories> categories;
  final UserFeedbackState state;
  final String appVersion;

  UserFeedback({
    String? id,
    required UserInfo author,
    required this.title,
    required this.description,
    required this.categories,
    required this.state,
    required this.appVersion,
    required DateTime creationTime,
  }) : super(
            id: id ?? const Uuid().v4(),
            author: author,
            creationTime: creationTime);

  @override
  JsonMap toJson() => {
        "id": id,
        "author": author.toJson(),
        "creationTime": dateToJson(creationTime),
        "categories": categories.map((e) => e.name).toList(),
        "state": state.name,
        "appVersion": appVersion,
        "title": title,
        "description": description
      };

  @override
  String toString() => toJson().toString();

  @override
  int get hashCode => toString().hashCode;
  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  factory UserFeedback.fromDoc(DocumentSnapshot document) =>
      UserFeedback.fromJson(documentSnaphsotToJson(document));

  factory UserFeedback.fromJson(JsonMap map) {
    return UserFeedback(
      id: map["id"] as String,
      author: UserInfo.fromJson(map["author"]),
      creationTime: dateFromJson(map['creationTime'] as int),
      categories: (map["categories"] as List<dynamic>)
          .map((e) =>
              UserFeedbackCategories.values.firstWhere((r) => r.name == e))
          .toList(),
      state: UserFeedbackState.values.firstWhere((e) => e.name == map["state"]),
      appVersion: map["appVersion"],
      title: map["title"],
      description: map["description"],
    );
  }

  UserFeedback copyWith(
      {String? id,
      UserInfo? author,
      DateTime? creationTime,
      List<UserFeedbackCategories>? categories,
      UserFeedbackState? state,
      String? appVersion,
      String? title,
      String? description}) {
    return UserFeedback(
        id: id ?? this.id,
        author: author ?? this.author,
        creationTime: creationTime ?? this.creationTime,
        categories: categories ?? this.categories,
        state: state ?? this.state,
        appVersion: appVersion ?? this.appVersion,
        title: title ?? this.title,
        description: description ?? this.description);
  }
}