import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../cubits/upload/file_upload_cubit.dart';
import '../../../../cubits/upload/firebase/firebase_file_upload_cubit.dart';
import '../../../../cubits/upload/video/video_upload_cubit.dart';
import '../../../../models/asset/asset.dart';
import '../../../../models/place.dart';
import '../../../../models/post/post.dart';
import '../../../../models/user/user.dart';
import 'post_update_tracker.dart';

part 'abstract_post_editor_state.dart';
part 'abstract_post_editor_cubit.freezed.dart';

abstract class AbstractPostEditorCubit extends Cubit<PostEditorState> {
  // must be given
  final UserInfo user;

  // To track updates
  PostUpdateTracker updateTracker;

  // Fields of the editor
  final Post? originalPost; // only set if created from post
  String title = "";
  String description = "";
  PostVisibility visibility = PostVisibility.visible;
  BetterVideoUploadCubit? mainVideoUploadCubit;

  // upload extra media
  List<FileUploadCubit> mediaUploadCubits = [];

  Place? place;

  AbstractPostEditorCubit.createEmpty(this.user, this.updateTracker)
      : originalPost = null,
        super(PostEditorState.editing(updateTracker, false));

  AbstractPostEditorCubit.fromPost(this.user, Post post, this.updateTracker)
      : originalPost = post,
        title = post.title,
        description = post.description,
        visibility = post.visibility,
        place = post.place,
        mainVideoUploadCubit = BetterVideoUploadCubit.fromExistingAsset(
            post.mainAsset as VideoAsset),
        mediaUploadCubits = post.media.map((asset) {
          if (asset is FirebaseAsset) {
            return FirebaseFileUploadCubit.fromExistingAsset(asset);
          } else if (asset is VideoAsset) {
            return BetterVideoUploadCubit.fromExistingAsset(asset);
          }

          throw InvalidAssetTypeException();
        }).toList(),
        super(PostEditorState.editing(updateTracker, true));

  void updateTitle(String title) {
    this.title = title;
    _emitFieldUpdate();
  }

  void updateDescription(String description) {
    this.description = description;
    _emitFieldUpdate();
  }

  void updateMainVideoUploadCubit(BetterVideoUploadCubit? videoUploadCubit) {
    mainVideoUploadCubit = videoUploadCubit;
    _emitFieldUpdate();
  }

  void updateMediaUploadCubits(List<FileUploadCubit> mediaUploadCubits) {
    this.mediaUploadCubits = mediaUploadCubits;
    _emitFieldUpdate();
  }

  void updatePlace(Place? place) {
    this.place = place;
    updateTracker = updateTracker.addUpdatePlace();
    _emitFieldUpdate();
  }

  void addMainVideoUploadCubit(BetterVideoUploadCubit videoUploadCubit) {
    assert(mainVideoUploadCubit == null,
        "There can only be one main video upload cubit");
    mainVideoUploadCubit = videoUploadCubit;
    _emitFieldUpdate();
  }

  void addMediaFromFile(File file) {
    AssetType assetType = Asset.inferAssetTypeFromFile(file);
    if (assetType == AssetType.video) {
      BetterVideoUploadCubit videoUploadCubit =
          BetterVideoUploadCubit.fromFile(file);
      mediaUploadCubits.add(videoUploadCubit);
    } else if (assetType == AssetType.firebaseAsset) {
      FirebaseFileUploadCubit firebaseUploadCubit =
          FirebaseFileUploadCubit.fromFile(file);
      mediaUploadCubits.add(firebaseUploadCubit);
    } else {
      throw InvalidAssetTypeException();
    }

    updateTracker = updateTracker.addUpdateMedia();
    _emitFieldUpdate();
  }

  void removeMainVideoUploadCubit() {
    mainVideoUploadCubit?.close();
    mainVideoUploadCubit = null;
    _emitFieldUpdate();
  }

  void removeMediaUploadCubit(String cubitId) {
    FileUploadCubit cubitToDelete =
        mediaUploadCubits.firstWhere((cubit) => cubit.id == cubitId);
    cubitToDelete.close();

    mediaUploadCubits =
        mediaUploadCubits.where((cubit) => cubit.id != cubitId).toList();

    updateTracker = updateTracker.addUpdateMedia();
    _emitFieldUpdate();
  }

  Future<void> submit() =>
      throw (UnimplementedError("You must override this in child classes"));

  bool validateInput() {
    return title != "" &&
        place != null &&
        _validateMainVideoUploadCubit() &&
        _validateMediaUploadCubits();
  }

  bool _validateMainVideoUploadCubit() {
    if (mainVideoUploadCubit == null) {
      return false;
    }
    return mainVideoUploadCubit!.hasUploaded;
  }

  bool _validateMediaUploadCubits() {
    for (var cubit in mediaUploadCubits) {
      if (!cubit.hasUploaded) {
        return false;
      }
    }
    return true;
  }

  bool _canEmitUpdate() {
    return state.maybeWhen(editing: (_, __) => true, orElse: () => false);
  }

  void _emitFieldUpdate() {
    if (_canEmitUpdate()) {
      emit(PostEditorState.editing(updateTracker, validateInput()));
    }
  }

  Asset mediaUploadCubitToAssetHelper(FileUploadCubit uploadCubit) =>
      uploadCubit.state.maybeWhen(
        uploaded: (asset) => asset,
        orElse: () => throw Exception(
            "BetterVideoUploadCubit has not finished uploading yet"),
      );

  List<Asset> mediaUploadCubitsToAssetHelper(
      List<FileUploadCubit> uploadCubits) {
    return uploadCubits
        .map((cubit) => mediaUploadCubitToAssetHelper(cubit))
        .toList();
  }

  /// Given a list of [uploadCubits] clsoe all cubits so they can free their ressources
  void _disposeVideoUploadCubits(List<BetterVideoUploadCubit> uploadCubits) {
    for (var cubit in uploadCubits) {
      cubit.close();
    }
  }

  /// Do necessary cleanup when cubit is closed
  /// Especially remove no longer used video upload cubits so they can free their memory
  @override
  Future<void> close() {
    // delete all VideoUploadCubits
    // when post has sucessfuly been posted this is already done when sending it away
    // we must catch the time, when post editor has been closed before sending
    //_disposeVideoUploadCubits(videoUploadCubits);
    mainVideoUploadCubit?.close();

    return super.close();
  }
}
