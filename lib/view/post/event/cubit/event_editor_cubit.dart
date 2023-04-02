import 'package:flutter/material.dart';

import '../../../../../../models/asset/asset.dart';
import '../../../../../../models/post/post.dart';
import '../../../../../../models/user/user.dart';
import '../../../../../../repositories/post_repository/post_repository.dart';
import '../../../../../../repositories/post_repository/post_repository.impl.dart';
import '../../../../utils/extensions/date_time.dart';
import '../../cubits/abstract_post_editor_cubit/abstract_post_editor_cubit.dart';
import 'event_update_tracker.dart';

class EventEditorCubit extends AbstractPostEditorCubit {
  final PostRepository _postRepository = PostRepositoryImpl();

  DateTime startTime;
  EventEditorCubit.createEmpty(UserInfo user)
      : startTime = DateTime.now()
            .add(const Duration(days: 5))
            .withTime(const TimeOfDay(hour: 14, minute: 0)),
        super.createEmpty(user, const EventUpdateTracker());

  EventEditorCubit.fromEvent(UserInfo user, Event event)
      : startTime = event.startTime,
        super.fromPost(user, event, const EventUpdateTracker());

  void updateStartTime(DateTime startTime) => this.startTime = startTime;

  @override
  Future<void> submit() async {
    emit(const PostEditorState.submitting());
    // Assume Validation happened sucessfully
    final List<Asset> videoAssets =
        videoUploadCubitsToAssetsHelper(videoUploadCubits);
    try {
      // create new Event
      if (originalPost == null) {
        final event = Event.createWithId(
            authorId: user.id,
            title: title,
            description: description,
            visibility: visibility,
            place: place!,
            media: videoAssets,
            startTime: startTime,
            members: [user.id]);
        await _postRepository.createPost(event);
        emit(PostEditorState.submitted(event.id));
      } else {
        await _postRepository.updatePost(originalPost!.id,
            visibility: visibility,
            title: title,
            description: description,
            media: videoAssets,
            startTime: startTime,
            place: place!);
        emit(PostEditorState.submitted(originalPost!.id));
      }
    } catch (err) {
      emit(PostEditorState.error(err.toString()));
    }
  }
}
