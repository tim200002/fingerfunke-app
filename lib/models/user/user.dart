import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(explicitToJson: true)
class UserInfo extends DatabaseDocument {
  final String name;
  final ImageAsset? picture;

  const UserInfo({
    required FirestoreId id,
    required this.name,
    this.picture,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'picture': picture?.toJson(),
      };

  factory UserInfo.fromJson(Map<String, dynamic> map) => UserInfo(
        id: map['id'] as String,
        name: map['name'] as String,
        picture: map['picture'] == null
            ? null
            : ImageAsset.fromJson(map['picture'] as Map<String, dynamic>),
      );

  factory UserInfo.fromDoc(DocumentSnapshot document) =>
      UserInfo.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture];
}

typedef ClearanceLevel = int;

@JsonSerializable(explicitToJson: true)
class User extends UserInfo {
  static const ClearanceLevel clearanceUser = 1;
  static const ClearanceLevel clearanceAdmin = 7;

  final int? age;
  final int? clearance;

  const User({
    required FirestoreId id,
    required String name,
    ImageAsset? picture,
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
        'picture': picture?.toJson(),
        'age': age,
        'clearance': clearance
      };

  factory User.fromJson(Map<String, dynamic> map) => User(
      id: map['id'] as String,
      name: map['name'] as String,
      picture: map['picture'] == null
          ? null
          : ImageAsset.fromJson(map['picture'] as Map<String, dynamic>),
      age: map['age'] as int?,
      clearance: map['clearance'] as int?);

  factory User.fromDoc(DocumentSnapshot document) =>
      User.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture, age];
}
