import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fingerfunke_app/models/errors_and_exceptions.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/models/utils.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'abstract_models.serialize.dart';

abstract class DocumentSerializable {
  Map<String, dynamic> toMap({bool includeId = false});
}

class DatabaseDocument extends Equatable implements DocumentSerializable {
  final FirestoreId id;

  const DatabaseDocument({required this.id});

  @override
  Map<String, dynamic> toMap({bool includeId = false}) {
    final Map<String, dynamic> serialized = {};
    if (includeId) {
      serialized.addAll({'id': id});
    }
    return serialized;
  }

  factory DatabaseDocument.fromMap(Map<String, dynamic> map) {
    String? id = map['id'];
    if (id == null) {
      throw KeyNotFoundException();
    }
    return DatabaseDocument(id: id);
  }

  factory DatabaseDocument.fromDoc(DocumentSnapshot document) {
    return DatabaseDocument.fromMap(docToMap(document));
  }

  @override
  List<Object> get props => [id];
}

class UserGeneratedDocument extends DatabaseDocument {
  final UserInfo author;

  const UserGeneratedDocument({required id, required this.author})
      : super(id: id);

  @override
  Map<String, dynamic> toMap({bool includeId = false}) {
    return {
      ...super.toMap(includeId: includeId),
      'author': author.toMap(includeId: true)
    };
  }

  factory UserGeneratedDocument.fromMap(Map<String, dynamic> map) {
    return UserGeneratedDocument(
        id: map['id'], author: UserInfo.fromMap(map['author']));
  }

  factory UserGeneratedDocument.fromDoc(DocumentSnapshot document) =>
      UserGeneratedDocument.fromMap(docToMap(document));
}
