import 'dart:io';

import 'package:fingerfunke_app/common_widgets/helper_widgets.dart';
import 'package:fingerfunke_app/common_widgets/upload/video_upload_tile.dart';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/post/cubits/post_editor_cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Section which handles the upload of videos
class VideoUploadSection extends StatelessWidget {
  const VideoUploadSection({Key? key}) : super(key: key);

  Widget _content(List<VideoUploadCubit> uploadCubits, BuildContext context) {
    return InkWell(
      onTap: () async {
        File? video =
            await Navigator.push<File?>(context, VideoRecorderPage.route());
        if (video != null) {
          context.read<PostEditorCubit>().addVideo(video);
        }
      },
      child: HelperWidgets.materialHero(
        tag: VideoRecorderPage.videoHeroTag,
        child: (uploadCubits.isNotEmpty)
            ? VideoUploadTile(
                cubit: uploadCubits[0],
                onDelete: (cubitId) =>
                    context.read<PostEditorCubit>().removeVideo(cubitId),
                width: 125,
                height: 210,
              )
            : Container(
                width: 125,
                height: 210,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Icon(Icons.add_a_photo_outlined)),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          editEvent: (fields, _) => _content(fields.videoUploadCubits, context),
          editGroup: (fields, _) => _content(fields.videoUploadCubits, context),
          orElse: () => throw InvalidStateException()),
    );
  }
}
