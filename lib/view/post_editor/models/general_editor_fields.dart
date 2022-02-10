import 'package:equatable/equatable.dart';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';

part 'group_editor_fields.dart';
part 'post_editor_fields.dart';

class InvalidEditorFieldTypeException implements Exception {}

class GeneralEditorFields extends Equatable {
  final String title;
  final String description;
  final post_visibility visibility;
  final List<VideoUploadCubit> videoUploadCubits;

  const GeneralEditorFields._(
      {required this.description,
      required this.title,
      required this.videoUploadCubits,
      required this.visibility});

  GeneralEditorFields._createEmpty()
      : title = "",
        description = "",
        visibility = post_visibility.visible,
        videoUploadCubits = [];

  GeneralEditorFields._fromPost(Post post)
      : title = post.title,
        description = post.description,
        visibility = post.visibility,
        videoUploadCubits = post.media
            .map(
              (videoAsset) => VideoUploadCubit.fromExistingAsset(
                videoAsset as VideoAsset,
              ),
            )
            .toList();

  /// helper function to make copyiing of PostEditorFields and GroupEditorFiels easier
  /// if we only want to copy values of the GeneralEditorFields class and do not know the instance of [fields]
  static GeneralEditorFields copyWithHelper(GeneralEditorFields fields,
      {String? title,
      String? description,
      post_visibility? visibility,
      List<VideoUploadCubit>? videoUploadCubits}) {
    if (fields is GroupEditorFields) {
      return fields.copyWith(
          title: title,
          description: description,
          visibility: visibility,
          videoUploadCubits: videoUploadCubits);
    } else if (fields is EventEditorFields) {
      return fields.copyWith(
          title: title,
          description: description,
          visibility: visibility,
          videoUploadCubits: videoUploadCubits);
    } else {
      throw InvalidEditorFieldTypeException();
    }
  }

  bool _validate() {
    return _validateUploadCubits();
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

  @override
  List<Object?> get props =>
      [title, description, visibility, videoUploadCubits];
}
