//! Please do not use JSON Annotator for these classes, since deserialization is to complex for it
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../utils.dart';

enum MessageType { video, text }

enum MessageVisibility { visible, deleted }

const _messageTypeEnumMap = {
  MessageType.video: 'video',
  MessageType.text: 'text',
};

class InvalidMessageTypeException implements Exception {}

class Message extends UserGeneratedDocument {
  final MessageType type;
  final MessageVisibility visibility;

  const Message({
    required FirestoreId id,
    required this.type,
    required this.visibility,
    required FirestoreId authorId,
    required DateTime creationTime,
  }) : super(authorId: authorId, id: id, creationTime: creationTime);

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
  List<Object?> get props => [id, type, authorId, creationTime];
}

class VideoMessage extends Message {
  final Link video;

  const VideoMessage(
      {required FirestoreId id,
      required MessageVisibility visibility,
      required FirestoreId authorId,
      required DateTime creationTime,
      required this.video})
      : super(
            authorId: authorId,
            id: id,
            visibility: visibility,
            creationTime: creationTime,
            type: MessageType.video);

  @override
  JsonMap toJson() => {
        'id': id,
        'visibility': visibility.name,
        'author': authorId,
        'creationTime': dateToJson(creationTime),
        'type': _messageTypeEnumMap[MessageType.video],
        'video': video
      };

  factory VideoMessage.fromJson(JsonMap map) {
    return VideoMessage(
      id: map['id'] as String,
      authorId: map['authorId'],
      creationTime: dateFromJson(map['creationTime'] as int),
      video: map['video'] as String,
      visibility: map['visibility'] != null
          ? MessageVisibility.values.firstWhere((t) => t.name == map['visibility'])
          : MessageVisibility.visible,
    );
  }

  factory VideoMessage.fromDoc(DocumentSnapshot document) =>
      VideoMessage.fromJson(documentSnaphsotToJson(document));

  factory VideoMessage.createWithId(
          {required FirestoreId authorId, required Link video}) =>
      VideoMessage(
          id: const Uuid().v4(),
          authorId: authorId,
          visibility: MessageVisibility.visible,
          creationTime: DateTime.now(),
          video: video);

  @override
  List<Object?> get props => [id, type, authorId, creationTime, video];
}

class TextMessage extends Message {
  final String text;

  const TextMessage(
      {required FirestoreId id,
      required FirestoreId authorId,
      required DateTime creationTime,
      required MessageVisibility visibility,
      required this.text})
      : super(
            authorId: authorId,
            id: id,
            visibility: visibility,
            creationTime: creationTime,
            type: MessageType.text);

  @override
  JsonMap toJson() => {
        'id': id,
        'authorId': authorId,
        'creationTime': dateToJson(creationTime),
        'type': _messageTypeEnumMap[MessageType.text],
        'text': text,
        'visibility': visibility.name
      };

  @override
  factory TextMessage.fromJson(JsonMap map) => TextMessage(
        id: map['id'] as String,
        authorId: map['authorId'],
        creationTime: dateFromJson(map['creationTime'] as int),
        text: map['text'] as String,
        visibility: map['visibility'] != null
            ? MessageVisibility.values.firstWhere((t) => t.name == map['visibility'])
            : MessageVisibility.visible,
      );

  factory TextMessage.fromDoc(DocumentSnapshot document) =>
      TextMessage.fromJson(documentSnaphsotToJson(document));

  factory TextMessage.createWithId(
          {required FirestoreId authorId, required String text}) =>
      TextMessage(
          id: const Uuid().v4(),
          authorId: authorId,
          visibility: MessageVisibility.visible,
          creationTime: DateTime.now(),
          text: text);

  @override
  List<Object?> get props => [id, type, authorId, creationTime, text];
}
