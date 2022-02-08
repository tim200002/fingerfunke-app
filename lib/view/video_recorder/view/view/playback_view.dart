import 'dart:io';

import 'package:fingerfunke_app/view/video_recorder/view/cubit/video_recorder_cubit.dart';
import 'package:fingerfunke_app/view/video_recorder/view/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () =>
              BlocProvider.of<VideoRecorderCubit>(context).recordNewVideoClip(),
        ),
        title: const Text('Preview'),
      ),
      floatingActionButton: _controller.value.isInitialized
          ? FloatingActionButton(
              child: const Icon(Icons.send_rounded),
              onPressed: () {
                Navigator.of(context).pop(widget.file);
              },
            )
          : null,
      body: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const LoadingView(),
      extendBodyBehindAppBar: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
