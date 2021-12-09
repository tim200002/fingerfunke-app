import 'dart:io';
import 'dart:typed_data';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoUploadTile extends StatelessWidget {
  final File video;
  final UserInfo author;
  final int? height;
  final int? width;
  const VideoUploadTile(this.video, this.author, {this.width, this.height, Key? key})
      : super(key: key);

  Widget getImage(Uint8List? thumbnail) {
    if (thumbnail != null) {
      return Image(image: MemoryImage(thumbnail), height: height?.toDouble(), width: width?.toDouble(),fit: BoxFit.cover,);
    }
    return Container(
      color: Colors.grey,
      height: height?.toDouble(),
    width: width?.toDouble(),
    );
  }

  Widget showLoadingTile(Uint8List? thumbnail) {
    return Stack(
        alignment: AlignmentDirectional.center,
        children: [getImage(thumbnail), CircularProgressIndicator()]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoUploadCubit(video, author),
      child: Builder(
        builder: (context) => BlocBuilder<VideoUploadCubit, VideoUploadState>(
            builder: (context, state) => state.when(
                initial: () => showLoadingTile(null),
                uploading: (thumb) => showLoadingTile(thumb),
                processing: (thumb) => showLoadingTile(thumb),
                uploaded: (thumb, _) => getImage(thumb),
                error: (error) => ErrorWidget(error))),
      ),
    );
  }
}
