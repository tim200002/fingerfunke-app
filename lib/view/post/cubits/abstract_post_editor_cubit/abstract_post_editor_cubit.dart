import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../cubits/video_upload_cubit/video_upload_cubit.dart';
import '../../../../models/asset/asset.dart';
import '../../../../models/post/post.dart';
import '../../../../models/user/user.dart';
import '../../../../utils/type_aliases.dart';
import 'updateTracker.dart';

part 'abstract_post_editor_state.dart';
part 'abstract_post_editor_cubit.freezed.dart';

abstract class AbstractPostEditorCubit extends Cubit<PostEditorState> {
  // must be given
  final UserInfo user;

  // To track updates
  final PostUpdateTracker updateTracker;

  // Fields of the editor
  final Post? originalPost; // only set if created from post
  String title = "";
  String description = "";
  PostVisibility visibility = PostVisibility.visible;
  List<VideoUploadCubit> videoUploadCubits = [];
  PostPlace? place;

  AbstractPostEditorCubit.createEmpty(this.user, this.updateTracker)
      :originalPost=null, super(PostEditorState.editing(updateTracker, false));

  AbstractPostEditorCubit.fromPost(this.user, Post post, this.updateTracker)
      :
      originalPost=post,
      title = post.title,
        description = post.description,
        visibility = post.visibility,
        place = post.place,
        videoUploadCubits = post.media
            .map(
              (videoAsset) => VideoUploadCubit.fromExistingAsset(
                videoAsset as VideoAsset,
              ),
            )
            .toList(),
        super(PostEditorState.editing(updateTracker, true));


    void updateTitle(String title) {
      this.title = title;
      _emitFieldUpdate();
    }
    void updateDescription(String description) {
      this.description = description;
      _emitFieldUpdate();
    }
    void updateVideoUploadCubits(List<VideoUploadCubit> videoUploadCubits) {
      this.videoUploadCubits = videoUploadCubits;
      _emitFieldUpdate();
    }
    void updatePlace(PostPlace? place) {
       this.place = place;
       updateTracker.addUpdatePlace();
       _emitFieldUpdate();
    }
    void addVideoUploadCubit(VideoUploadCubit videoUploadCubit){
      videoUploadCubits.add(videoUploadCubit);
      _emitFieldUpdate();
    }

    void removeVideoUploadCubit(String cubitId){

      VideoUploadCubit cubitToDelete = videoUploadCubits.firstWhere((cubit) => cubit.id == cubitId);
      cubitToDelete.close();

      videoUploadCubits = videoUploadCubits.where((cubit) => cubit.id != cubitId).toList();

      List<VideoUploadCubit> removeCubitByIdFromList(
              List<VideoUploadCubit> uploadCubits, String cubitId) =>
          uploadCubits.where((cubit) => cubit.id != cubitId).toList();
    }

    Future<void> submit() => throw(UnimplementedError("You must override this in child classes"));

    bool validateInput(){
      return _validateUploadCubits() && title != "" && place != null;
    }

  bool _validateUploadCubits() {
    if (videoUploadCubits.isEmpty) {
      return false;
    }
    for (var cubit in videoUploadCubits) {
      if (!cubit.hasUploaded) {
        return false;
      }
    }
    return true;
  }

  bool _canEmitUpdate(){
    return state.maybeWhen(editing: (_, __) => true, orElse: () => false);
  }

  void _emitFieldUpdate(){
    if(_canEmitUpdate()){
        emit(PostEditorState.editing(updateTracker, validateInput()));
     }
  }

  /// helper to map the List of uploadCubits to a list of assets
  ///
  /// This will throw an error if at least on upload cubit has not finished uploading
  /// and therefore the asset does not exist yet
  List<Asset> videoUploadCubitsToAssetsHelper(
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

  /// Do necessary cleanup when cubit is closed
  /// Especially remove no longer used video upload cubits so they can free their memory
  @override
  Future<void> close() {
    // delete all VideoUploadCubits
    // whe npost has sucessfuly been posted this is already done when sending it away
    // we must catch the time, when post editor has been closed before sending
    _disposeVideoUploadCubits(videoUploadCubits);

    return super.close();
  }
}
