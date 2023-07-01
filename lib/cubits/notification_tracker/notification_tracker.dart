import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/notification/notification.dart' as my_models;
import '../../utils/type_aliases.dart';

class NotificationTracker extends Cubit<List<my_models.Notification>> {
  late final CollectionReference _firestore;
  late final StreamSubscription _subscription;

  NotificationTracker(FirestoreId userId) : super([]) {
    _firestore =
        GetIt.I<FirebaseFirestore>().collection('users/$userId/notifications');

    _subscription = _firestore.snapshots().listen((event) {
      emit(event.docs.map((e) => my_models.Notification.fromDoc(e)).toList());
    });
  }

  /// Helper to dynamically build widget based on if the post or any related data (chat)
  /// has a notification.
  static Widget postBuilder(
          FirestoreId postId, Widget Function(bool hasNotification) builder) =>
      BlocBuilder<NotificationTracker, List<my_models.Notification>>(
        builder: (context, state) {
          bool hasNotification = false;
          for (final notification in state) {
            switch (notification.notificationType) {
              case my_models.NotificationType.postEdited:
                {
                  if (notification.objectRef == postId) {
                    hasNotification = true;
                  }
                  break;
                }
              case my_models.NotificationType.message:
                {
                  if (notification.objectRef == postId) {
                    hasNotification = true;
                  }
                  break;
                }
              default:
                break;
            }
          }
          return builder(hasNotification);
        },
      );

  /// Helper to dynamically build widget based on if the chat has a notification.
  static Widget chatBuilder(
          FirestoreId postId, Widget Function(bool hasNotification) builder) =>
      BlocBuilder<NotificationTracker, List<my_models.Notification>>(
        builder: (context, state) {
          bool hasNotification = false;
          for (final notification in state) {
            switch (notification.notificationType) {
              case my_models.NotificationType.message:
                {
                  if (notification.objectRef == postId) {
                    hasNotification = true;
                  }
                  break;
                }
              default:
                break;
            }
          }
          return builder(hasNotification);
        },
      );

  /// Helper to dynamically build widget based on if any post or related data (chat) has a notification.
  static Widget anyPostBuilder(Widget Function(bool hasNotification) builder) =>
      BlocBuilder<NotificationTracker, List<my_models.Notification>>(
        builder: (context, state) {
          bool hasNotification = false;
          for (final notification in state) {
            switch (notification.notificationType) {
              case my_models.NotificationType.postEdited:
                {
                  hasNotification = true;
                  break;
                }
              case my_models.NotificationType.message:
                {
                  hasNotification = true;
                  break;
                }
              default:
                break;
            }
          }
          return builder(hasNotification);
        },
      );

  Future<void> registerPostOpening(FirestoreId postId) async {
    List<my_models.Notification> notificationsToDeleted = state
        .where((element) =>
            element.notificationType == my_models.NotificationType.postEdited &&
            element.objectRef == postId)
        .toList();
    for (final notification in notificationsToDeleted) {
      await _firestore.doc(notification.id).delete();
    }
  }

  Future<void> registerChatOpening(FirestoreId postId) async {
    List<my_models.Notification> notificationsToDeleted = state
        .where((element) =>
            element.notificationType == my_models.NotificationType.message &&
            element.objectRef == postId)
        .toList();
    for (final notification in notificationsToDeleted) {
      await _firestore.doc(notification.id).delete();
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
