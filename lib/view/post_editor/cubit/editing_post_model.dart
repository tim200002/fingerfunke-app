import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FDateTime on DateTime {
  static DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  static DateFormat timeFormat = DateFormat("HH:mm");

  DateTime copyTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute, 0, 0, 0);

  DateTime copyDate(DateTime date) =>
      DateTime(date.year, date.month, date.day, hour, minute, 0, 0, 0);

  String get dateString => dateFormat.format(this);
  String get timeString => timeFormat.format(this);

  TimeOfDay get timeOfDay => TimeOfDay.fromDateTime(this);
}

class EditingPost {
  final FirestoreId? id;
  final UserInfo? author;
  final DateTime? creationTime;

  final post_type type;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final post_visibility? visibility;
  final String? location;
  final List<Link> media;

  final String? recTime;
  final DateTime eveTime;

  EditingPost(
      {this.id,
      this.author,
      this.creationTime,
      this.type = post_type.event,
      String title = "",
      String description = "",
      TextEditingController? titleController,
      TextEditingController? descriptionController,
      this.visibility,
      this.location,
      this.recTime,
      DateTime? eveTime,
      this.media = const []})
      : this.eveTime = eveTime ?? DateTime.now(),
        this.titleController =
            titleController ?? TextEditingController(text: title),
        this.descriptionController =
            descriptionController ?? TextEditingController(text: description);

  bool _isValidPost() {
    return id != null &&
        author != null &&
        creationTime != null &&
        //type != null &&
        //titleController.text != null &&
        //description != null &&
        visibility != null &&
        location != null;
    //maybe check if media empty
  }

  bool _isValidEvent() {
    return id != null && eveTime != null;
  }

  bool _isValidRecurrent() {
    return _isValidPost() && recTime != null;
  }

  bool get isEvent => type == post_type.event;
  bool get isRecurrent => type == post_type.recurrent;

  EditingPost copyWith(
      {FirestoreId? id,
      UserInfo? author,
      DateTime? creationTime,
      post_type? type,
      String? title,
      String? description,
      post_visibility? visibility,
      String? recTime, // time of the recurrent
      DateTime? eveTime, // time  of the event
      String? location,
      List<Link>? media}) {
    return EditingPost(
        id: id ?? this.id,
        author: author ?? this.author,
        creationTime: creationTime ?? this.creationTime,
        type: type ?? this.type,
        titleController: titleController,
        descriptionController: descriptionController,
        visibility: visibility ?? this.visibility,
        location: location ?? this.location,
        media: media ?? this.media,
        recTime: recTime ?? this.recTime,
        eveTime: eveTime ?? this.eveTime);
  }

  factory EditingPost.fromPost(Post post) {
    return EditingPost(
      id: post.id,
      author: post.author,
      creationTime: post.creationTime,
      type: post.type,
      title: post.title,
      description: post.description,
      visibility: post.visibility,
      location: post.location,
      media: post.media,
    );
  }

  Post toPost() {
    if (!_isValidPost()) {
      throw Exception("Post is not a valid Event. Can't be created");
    }

    return Post(
        id: id!,
        author: author!,
        creationTime: creationTime!,
        type: type,
        title: titleController.text,
        description: descriptionController.text,
        visibility: visibility!,
        location: location!,
        media: media!);
  }
}
