import 'dart:io';

import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoUploadTile extends StatelessWidget {
  final File video;
  const VideoUploadTile(this.video, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoUploadCubit(video),
      child: Builder(
        builder: (context) => Container(
          width: 100,
          height: 100,
          color: Colors.green,
          child: BlocBuilder<VideoUploadCubit, VideoUploadState>(
            builder: (context, state) => Text(
              state.when(
                  initial: () => "initial",
                  uploading: (_) => "uploading",
                  processing: (_) => "processing",
                  uploaded: (_, __) => "uploaded",
                  error: () => "error"),
            ),
          ),
        ),
      ),
    );
  }
}
