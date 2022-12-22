//! Please do not use JSON Annotator for these classes, since deserialization is to complex for it
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../user/user.dart';
import '../utils.dart';

enum MessageType { video, text }

const _messageTypeEnumMap = {
  MessageType.video: 'video',
  MessageType.text: 'text',
};

class InvalidMessageTypeException implements Exception {}

class Message extends UserGeneratedDocument {
  final MessageType type;

  const Message({
    required FirestoreId id,
    required this.type,
    required UserInfo author,
    required DateTime creationTime,
  }) : super(author: author, id: id, creationTime: creationTime);

  @override
  JsonMap toJson() {
    if (this is VideoMessage) {
      return (this as VideoMessage).toJson();
    } else if (this is TextMessage) {
      return (this as TextMessage).toJson();
    } else {
      throw InvalidMessageTypeException();
    }
  }

  factory Message.fromJson(JsonMap map) {
    switch ($enumDecode(_messageTypeEnumMap, map['type'])) {
      case MessageType.video:
        {
          return VideoMessage.fromJson(map);
        }
      case MessageType.text:
        {
          return TextMessage.fromJson(map);
        }
      default:
        {
          throw InvalidMessageTypeException();
        }
    }
  }

  factory Message.fromDoc(DocumentSnapshot document) =>
      Message.fromJson(documentSnaphsotToJson(document));

  @override
  List<Object?> get props => [id, type, author, creationTime];
}

class VideoMessage extends Message {
  final Link video;

  const VideoMessage(
      {required FirestoreId id,
      required UserInfo author,
      required DateTime creationTime,
      required this.video})
      : super(
            author: author,
            id: id,
            creationTime: creationTime,
            type: MessageType.video);

  @override
  JsonMap toJson() => {
        'id': id,
        'author': author.toJson(),
        'creationTime': dateToJson(creationTime),
        'type': _messageTypeEnumMap[MessageType.video],
        'video': video
      };

  factory VideoMessage.fromJson(JsonMap map) {
    return VideoMessage(
      id: map['id'] as String,
      author: UserInfo.fromJson(
        map['author'] as JsonMap,
      ),
      creationTime: dateFromJson(map['creationTime'] as int),
      video: map['video'] as String,
    );
  }

  factory VideoMessage.fromDoc(DocumentSnapshot document) =>
      VideoMessage.fromJson(documentSnaphsotToJson(document));

  factory VideoMessage.createWithId(
          {required UserInfo author, required Link video}) =>
      VideoMessage(
          id: const Uuid().v4(),
          author: author,
          creationTime: DateTime.now(),
          video: video);

  @override
  List<Object?> get props => [id, type, author, creationTime, video];
}

class TextMessage extends Message {
  final String text;

  const TextMessage(
      {required FirestoreId id,
      required UserInfo author,
      required DateTime creationTime,
      required this.text})
      : super(
            author: author,
            id: id,
            creationTime: creationTime,
            type: MessageType.text);

  @override
  JsonMap toJson() => {
        'id': id,
        'author': author.toJson(),
        'creationTime': dateToJson(creationTime),
        'type': _messageTypeEnumMap[MessageType.text],
        'text': text
      };

  @override
  factory TextMessage.fromJson(JsonMap map) => TextMessage(
        id: map['id'] as String,
        author: UserInfo.fromJson(
          map['author'] as JsonMap,
        ),
        creationTime: dateFromJson(map['creationTime'] as int),
        text: map['text'] as String,
      );

  factory TextMessage.fromDoc(DocumentSnapshot document) =>
      TextMessage.fromJson(documentSnaphsotToJson(document));

  factory TextMessage.createWithId(
          {required UserInfo author, required String text}) =>
      TextMessage(
          id: const Uuid().v4(),
          author: author,
          creationTime: DateTime.now(),
          text: text);

  @override
  List<Object?> get props => [id, type, author, creationTime, text];
}
