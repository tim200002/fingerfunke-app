import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

import '../../../../common_widgets/video/view/video_playback_view.dart';
import '../../../../utils/tools.dart';
import '../cubit/video_recorder_cubit.dart';

class PlaybackView extends StatefulWidget {
  final File file;
  const PlaybackView(this.file, {Key? key}) : super(key: key);

  @override
  _PlaybackViewState createState() => _PlaybackViewState();
}

class _PlaybackViewState extends State<PlaybackView> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    _initController().then((value) => setState(() {}));
    super.initState();
  }

  Future<void> _initController() async {
    _controller = VideoPlayerController.file(widget.file);
    await _controller.initialize();
    await _controller.setLooping(true);
    await _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => BlocProvider.of<VideoRecorderCubit>(context)
                    .recordNewVideoClip(),
              ),
              title: const Text('Preview'),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(FeatherIcons.save),
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.of(context).pop(widget.file);
              },
            ),
            body: VideoPlaybackView.controller(
              fit: BoxFit.cover,
              controller: _controller,
            ),
            extendBodyBehindAppBar: true,
          )
        : Tools.loadingScaffold();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
