part of './abstract_models.dart';

/*
Map<String, dynamic> _databaseDocumentToMap(DatabaseDocument instance,
    {Map<String, dynamic>? serialized, bool includeID = false}) {
  serialized = serialized ?? {};
  if (includeID) {
    serialized.addAll({'id': instance.id});
  }
  return serialized;
}

DatabaseDocument _databaseDocumentFromMap(Map<String, dynamic> map) {
  String? id = map['id'];
  if (id == null) {
    throw KeyNotFoundException();
  }
  return DatabaseDocument(id: id);
}

Map<String, dynamic> _userGeneratedDocumentToMap(UserGeneratedDocument instance,
    {Map<String, dynamic>? serialized, bool includeID = false}) {
  serialized = serialized ?? {};
  serialized.addAll({'author': instance.author.toMap(includeId: true)});
  return serialized;
}

UserGeneratedDocument _userGeneratedDocumentFromMap(Map<String, dynamic> map,
    {UserGeneratedDocument? instance}) {
  instance = instance ?? UserGeneratedDocument.empty();
  instance.author = UserReference.fromMap(map['author']);
  return _databaseDocumentFromMap(map, instance: instance)
      as UserGeneratedDocument;
}

*/