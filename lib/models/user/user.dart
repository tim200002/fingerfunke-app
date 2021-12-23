import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfo extends DatabaseDocument {
  final String name;
  final ImageAsset? picture;

  const UserInfo({required FirestoreId id, required this.name, this.picture})
      : super(id: id);
  @override
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  factory UserInfo.fromJson(Map<String, dynamic> map) =>
      _$UserInfoFromJson(map);

  factory UserInfo.fromDoc(DocumentSnapshot document) =>
      UserInfo.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture];
}

enum GENDER { male, female, divers }

@JsonSerializable(explicitToJson: true)
class User extends UserInfo {
  final int? age;
  final GENDER? gender;

  const User(
      {required FirestoreId id,
      required String name,
      ImageAsset? picture,
      this.age,
      this.gender})
      : super(id: id, name: name, picture: picture);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  factory User.fromDoc(DocumentSnapshot document) =>
      User.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, name, picture, age, gender];
}
