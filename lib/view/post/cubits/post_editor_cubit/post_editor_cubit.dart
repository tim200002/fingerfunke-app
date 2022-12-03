import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../../models/asset/asset.dart';
import '../../../../models/post/post.dart';
import '../../../../models/user/user.dart';
import '../../../../repositories/post_repository/post_repository.dart';
import '../../../../repositories/post_repository/post_repository.impl.dart';
import '../../../../utils/exceptions.dart';
import '../../editor_models/general_editor_fields.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../cubits/video_upload_cubit/video_upload_cubit.dart';

part 'post_editor_cubit.freezed.dart';
part 'post_editor_state.dart';

/// Class that holds the logic for interacting with the post editor
class PostEditorCubit extends Cubit<PostEditorState> {
  final UserInfo currentUser;
  final Post? postToBeEdited;
  final PostRepository _postRepository = PostRepositoryImpl();
  PostEditorCubit({required this.currentUser, this.postToBeEdited})
      : super(const PostEditorState.loading()) {
    // Check whether to edit post or to create new one
    // If bloc is initialized withou post, crate new one
    if (postToBeEdited != null) {
      if (postToBeEdited is Event) {
        emit(
          PostEditorState.editEvent(
              eventEditorFields:
                  EventEditorFields.fromEvent(postToBeEdited as Event),
              inputValid: true),
        );
      } else if (postToBeEdited is Group) {
        emit(PostEditorState.editGroup(
            groupEditorFields:
                GroupEditorFields.fromGroup(postToBeEdited as Group),
            inputValid: true));
      }
    }
    // Otherwise create new post (deault to create event)
    else {
      emit(
        PostEditorState.editEvent(
          eventEditorFields: EventEditorFields.createEmpty(),
        ),
      );
    }
  }

  /// Updates the current field values with the [updatedFields] and emits this new state
  void updateInformation(GeneralEditorFields updatedFields) {
    state.mapOrNull(
      editEvent: (state) {
        final newState = state.copyWith(
            eventEditorFields: updatedFields as EventEditorFields,
            inputValid: updatedFields.validate());
        emit(newState);
      },
      editGroup: (state) {
        final newState = state.copyWith(
            groupEditorFields: updatedFields as GroupEditorFields,
            inputValid: updatedFields.validate());
        emit(newState);
      },
    );
  }

  /// Validate all fields, there are different validation mechanisams for events and posts
  void validateInput() {
    state.maybeMap(
        editEvent: (state) => emit(
            state.copyWith(inputValid: state.eventEditorFields.validate())),
        editGroup: (state) => emit(
            state.copyWith(inputValid: state.groupEditorFields.validate())),
        orElse: () => throw InvalidStateException());
  }

  /// switch between creating post and events
  ///
  /// All fields for which it is possible will be mapped from post to event and vice versa
  /// It is however never possible to change the type of a post which is edited
  void switchEditorMode() {
    // switching is only possible when not editing old post
    // one cannot turn event into group and vice versa
    if (postToBeEdited == null) {
      state.maybeWhen(
          editEvent: (fields, _) => emit(PostEditorState.editGroup(
              groupEditorFields:
                  GroupEditorFields.fromEventEditorFields(fields))),
          editGroup: (fields, _) => emit(PostEditorState.editEvent(
              eventEditorFields:
                  EventEditorFields.fromGroupEditorFields(fields))),
          orElse: () => throw InvalidStateException());
    }
  }

  /// Add new video to the post
  ///
  /// In theory more than one video can be uploaded
  /// however the current UI does only support one video
  void addVideo(File video) {
    final updatedEditorFields = state.maybeMap(
        editEvent: (state) =>
            state.eventEditorFields.copyWith(videoUploadCubits: [
              ...state.eventEditorFields.videoUploadCubits,
              VideoUploadCubit.fromFile(video, onVideoUploaded: validateInput)
            ]),
        editGroup: (state) =>
            state.groupEditorFields.copyWith(videoUploadCubits: [
              ...state.groupEditorFields.videoUploadCubits,
              VideoUploadCubit.fromFile(video, onVideoUploaded: validateInput)
            ]),
        orElse: () => throw (InvalidStateException()));

    updateInformation(updatedEditorFields);
  }

  /// Remove a given video referenced by its [cubitId]
  ///
  /// this will handle closing all the necessary cubits
  void removeVideo(String cubitId) {
    VideoUploadCubit findCubityById(
            List<VideoUploadCubit> uploadCubits, String cubitId) =>
        uploadCubits.firstWhere((cubit) => cubit.id == cubitId);

    List<VideoUploadCubit> removeCubitByIdFromList(
            List<VideoUploadCubit> uploadCubits, String cubitId) =>
        uploadCubits.where((cubit) => cubit.id != cubitId).toList();

    VideoUploadCubit? cubitToDelete;
    state.maybeMap(
        editEvent: (state) {
          cubitToDelete = findCubityById(
              state.eventEditorFields.videoUploadCubits, cubitId);
          updateInformation(state.eventEditorFields.copyWith(
              videoUploadCubits: removeCubitByIdFromList(
                  state.eventEditorFields.videoUploadCubits, cubitId)));
        },
        editGroup: (state) {
          cubitToDelete = state.groupEditorFields.videoUploadCubits
              .firstWhere((cubit) => cubit.id == cubitId);
          updateInformation(state.groupEditorFields.copyWith(
              videoUploadCubits: state.groupEditorFields.videoUploadCubits
                  .where((cubit) => cubit.id != cubitId)
                  .toList()));
        },
        orElse: () => throw InvalidStateException());
    cubitToDelete?.close();
  }

  /// submit and upload a post to the database. returns if post is valid
  Future<void> submit() {
    return state.maybeWhen(
        editEvent: (eventEditorFields, _) async {
          emit(const PostEditorState.submitting());
          try {
            var eventId = await _createEventFromFields(eventEditorFields);
            emit(PostEditorState.submitted(eventId));
            _disposeVideoUploadCubits(eventEditorFields.videoUploadCubits);
          } catch (err) {
            emit(PostEditorState.error(err.toString()));
          }
        },
        editGroup: (groupEditorFields, _) async {
          emit(const PostEditorState.submitting());
          try {
            throw Exception("can't create posts so far");
            //var groupId = await _createGroupFromFields(groupEditorFields);
            //emit(PostEditorState.submitted(groupId));
            //disposeVideoUploadCubits(groupEditorFields.videoUploadCubits);
          } catch (err) {
            emit(PostEditorState.error(err.toString()));
          }
        },
        orElse: () => throw InvalidStateException());
  }

  
  /// Do necessary cleanup when cubit is closed
  /// Especially remove no longer used video upload cubits so they can free their memory
  @override
  Future<void> close() {
    // delete all VideoUploadCubits
    // whe npost has sucessfuly been posted this is already done when sending it away
    // we must catch the time, when post editor has been closed before sending
    state.whenOrNull(
        editEvent: ((eventEditorFields, _) =>
            _disposeVideoUploadCubits(eventEditorFields.videoUploadCubits)),
        editGroup: (groupEditorFields, _) =>
            _disposeVideoUploadCubits(groupEditorFields.videoUploadCubits));

    return super.close();
  }



  /// create Event from given [fields]
  ///
  /// if the editor has been created from an event then only update fields
  /// Otherwise a new event is created
  Future<String?> _createEventFromFields(EventEditorFields fields) async {
    if (fields.place == null) throw Exception("location is null");
    if (postToBeEdited == null) {
      final event = Event.createWithId(
          author: currentUser,
          title: fields.title,
          description: fields.description,
          visibility: fields.visibility,
          place: fields.place!,
          media: _videoUploadCubitsToAssetsHelper(fields.videoUploadCubits),
          startTime: fields.startTime);
      await _postRepository.createPost(event);
      await _postRepository.addPostMember(postId: event.id, user: currentUser);
      return event.id;
    } else {
      await _postRepository.updatePost(postToBeEdited!.id,
          visibility: fields.visibility,
          title: fields.title,
          description: fields.description,
          media: _videoUploadCubitsToAssetsHelper(fields.videoUploadCubits),
          startTime: fields.startTime,
          place: fields.place);
    }
  }

  /// create Group from given [fields]
  ///
  /// if the editor has been created from an exisitng Group then only update fields
  /// Otherwise a new group is created
  /*Future<String?> _createGroupFromFields(GroupEditorFields fields) async {
    if (fields. == null) throw Exception("location is null");
    if (postToBeEdited == null) {
      final group = Group.createWithId(
        author: currentUser,
        title: fields.title,
        description: fields.description,
        visibility: fields.visibility,
        place: fields.place,
        media: _videoUploadCubitsToAssetsHelper(fields.videoUploadCubits),
      );
      await _postRepository.createPost(group);
      await _postRepository.addPostMember(postId: group.id, user: currentUser);
      return group.id;
    } else {
      await _postRepository.updatePost(postToBeEdited!.id,
          visibility: fields.visibility,
          title: fields.title,
          description: fields.title,
          media: _videoUploadCubitsToAssetsHelper(fields.videoUploadCubits));
    }
  }*/


  /// helper to map the List of uploadCubits to a list of assets
  ///
  /// This will throw an error if at least on upload cubit has not finished uploading
  /// and therefore the asset does not exist yet
  List<Asset> _videoUploadCubitsToAssetsHelper(
      List<VideoUploadCubit> uploadCubits) {
    return uploadCubits
        .map(
          (cubit) => cubit.state.maybeWhen(
            uploaded: (_, asset) => asset,
            orElse: () => throw Exception(
                "At least one cubit has not finished uploading"),
          ),
        )
        .toList();
  }

  /// Given a list of [uploadCubits] clsoe all cubits so they can free their ressources
  void _disposeVideoUploadCubits(List<VideoUploadCubit> uploadCubits) {
    for (var cubit in uploadCubits) {
      cubit.close();
    }
  }

  bool get isEditingExistingPost => postToBeEdited != null;

 
}
