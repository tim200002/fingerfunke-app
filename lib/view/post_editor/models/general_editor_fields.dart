import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:flutter/material.dart';

part 'group_editor_fields.dart';
part 'post_editor_fields.dart';

class GeneralEditorFields {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final post_visibility visibility;
  final List<VideoUploadCubit> videoUploadCubits;

  GeneralEditorFields._(
      {required this.descriptionController,
      required this.titleController,
      required this.videoUploadCubits,
      required this.visibility});

  GeneralEditorFields._createEmpty()
      : titleController = TextEditingController(),
        descriptionController = TextEditingController(),
        visibility = post_visibility.visible,
        videoUploadCubits = [];

  GeneralEditorFields._fromPost(Post post)
      : titleController = TextEditingController(text: post.title),
        descriptionController = TextEditingController(text: post.description),
        visibility = post.visibility,
        videoUploadCubits = post.media
            .map(
              (videoAsset) => VideoUploadCubit.fromExistingAsset(
                videoAsset as VideoAsset,
              ),
            )
            .toList();

  GeneralEditorFields _copyWith(
          {final post_visibility? visibility,
          final List<VideoUploadCubit>? videoUploadCubits}) =>
      GeneralEditorFields._(
          descriptionController: descriptionController,
          titleController: titleController,
          videoUploadCubits: videoUploadCubits ?? this.videoUploadCubits,
          visibility: visibility ?? this.visibility);

  bool _validate() {
    return _validateUploadCubits();
  }

  bool _validateUploadCubits() {
    if (videoUploadCubits.isEmpty) {
      return false;
    }
    for (var cubit in videoUploadCubits) {
      if (!cubit.hasUploaded()) {
        return false;
      }
    }
    return true;
  }
}
