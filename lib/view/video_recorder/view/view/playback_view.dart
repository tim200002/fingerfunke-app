import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../common_widgets/video/video_playback_cubit/video_playback_cubit.dart';
import '../../../../common_widgets/video/view/video_playback_view.dart';
import '../../../../utils/tools.dart';
import '../cubit/video_recorder_cubit.dart';

class PlaybackView extends StatelessWidget {
  final File file;
  const PlaybackView(this.file, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: BlocProvider.of<VideoRecorderCubit>(context).reload,
          ),
          title: Text(l10n(context).lbl_cameraPreview),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(FeatherIcons.save),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.of(context).pop(file),
        ),
        extendBodyBehindAppBar: true,
        body: BlocProvider(
          create: (_) => VideoPlaybackCubit.file(file: file),
          child:
              const VideoPlaybackView(fit: BoxFit.cover, showProgressBar: true),
        ));
  }
}
