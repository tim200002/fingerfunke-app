import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/abstract_models/abstract_models.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class UserInfo extends DatabaseDocument {
  final String name;
  final Link? picture;

  const UserInfo({required UserID id, required this.name, this.picture})
      : super(id: id);

  @override
  Map<String, dynamic> toMap({bool includeId = false}) {
    return {
      ...super.toMap(includeId: includeId),
      'name': name,
      'picture': picture
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(id: map['id'], name: map['name'], picture: map['picture']);
  }

  factory UserInfo.fromDoc(DocumentSnapshot document) =>
      UserInfo.fromMap(docToMap(document));
}

enum GENDER { male, female, divers }

class User extends UserInfo {
  final int? age;
  final GENDER? gender;

  const User(
      {required UserID id,
      required String name,
      Link? picture,
      this.age,
      this.gender})
      : super(id: id, name: name, picture: picture);

  @override
  Map<String, dynamic> toMap({bool includeId = false}) {
    return {...super.toMap(), 'age': age, 'gender': gender};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        name: map['name'],
        picture: map['picture'],
        age: map['age'],
        gender: map['gender']);
  }

  factory User.fromDoc(DocumentSnapshot document) =>
      User.fromMap(docToMap(document));
}
