import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoUploadTile extends StatelessWidget {
  final Function(String) onAbort;
  final double height;
  final double width;

  final VideoUploadCubit cubit;

  static const double abortButtonRadius = 20;

  const VideoUploadTile(
      {
      required this.cubit,
      required this.onAbort,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  Widget abortButton() {
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        radius: abortButtonRadius,
        backgroundColor: Colors.redAccent,
        child: IconButton(
          onPressed: () => onAbort(cubit.id),
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
    );
  }

  Widget getImage(Uint8List? thumbnail) {
    if (thumbnail != null) {
      return Image(
        image: MemoryImage(thumbnail),
        height: height - abortButtonRadius,
        width: width - abortButtonRadius,
        fit: BoxFit.cover,
      );
    }
    return Container(
      color: Colors.grey,
      height: height - abortButtonRadius,
      width: width - abortButtonRadius,
    );
  }

  Widget loadingTile(Uint8List? thumbnail) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(alignment: Alignment.center, children: [
        getImage(thumbnail),
        const CircularProgressIndicator(),
        abortButton()
      ]),
    );
  }

  Widget uploadedTile(Uint8List? thumbnail) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [getImage(thumbnail), abortButton()],
      ),
    );
  }

  Widget errorTile(Uint8List? thumbnail, context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          getImage(thumbnail),
          IconButton(
            iconSize: min(height, width) / 2,
            icon: const Icon(
              Icons.restart_alt,
            ),
            color: Colors.redAccent,
            onPressed: () => cubit.uploadVideo(),
          ),
          abortButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoUploadCubit, VideoUploadState>(
      bloc: cubit,
      builder: (context, state) => state.when(
        initial: () => loadingTile(null),
        uploading: (thumb) => loadingTile(thumb),
        processing: (thumb) => loadingTile(thumb),
        uploaded: (thumb, _) => uploadedTile(thumb),
        error: (thumb, error) => errorTile(thumb, context),
      ),
    );
  }
}
