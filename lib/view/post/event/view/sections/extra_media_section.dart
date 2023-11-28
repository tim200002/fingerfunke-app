import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common_widgets/upload/upload_tile.dart';
import '../../../cubits/abstract_post_editor_cubit/abstract_post_editor_cubit.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../cubit/event_editor_cubit.dart';
import '../widgets/media_tiles/media_tile.dart';

class ExtraMediaSection extends StatefulWidget {
  final bool editing;

  const ExtraMediaSection(this.editing, {super.key});

  @override
  State<ExtraMediaSection> createState() => _ExtraMediaSectionState();
}

class _ExtraMediaSectionState extends State<ExtraMediaSection> {
  @override
  Widget build(BuildContext context) {
    return widget.editing ? const _Editing() : const _Viewing();
  }
}

class _Editing extends StatelessWidget {
  final int minSize = 150;
  final int padding = 10;
  const _Editing({super.key});

  @override
  Widget build(BuildContext context) {
    // calculate size of tile
    final width = MediaQuery.of(context).size.width;
    late final imageSize;
    if (width / 2 > minSize) {
      imageSize = (width / 2) - 4 * padding;
    } else {
      imageSize = width - 2 * padding;
    }

    return BlocBuilder<EventEditorCubit, PostEditorState>(
      builder: (context, state) {
        final cubit = context.read<EventEditorCubit>();
        // Grid View of all the media
        return Column(
          children: [
            Wrap(
              children: [
                ...cubit.mediaUploadCubits.map((uploadCubit) => Padding(
                      padding: EdgeInsets.all(padding.toDouble()),
                      child: UploadTile(
                          cubit: uploadCubit,
                          height: imageSize,
                          width: imageSize,
                          onDelete: (id) =>
                              cubit.removeMediaUploadCubit(uploadCubit.id)),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Viewing extends StatelessWidget {
  const _Viewing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) => state.when(
        normal: (post, _) => Wrap(
          children: [
            ...post.media.map((media) => MediaTile.getProperTile(media)),
          ],
        ),
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
