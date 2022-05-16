import 'dart:math';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoUploadTile extends StatelessWidget {
  final double height;
  final double? width;

  final VideoUploadCubit cubit;

  final Function(String) onDelete;

  static const double abortButtonRadius = 20;

  const VideoUploadTile(
      {required this.cubit,
      this.width,
      required this.height,
      required this.onDelete,
      Key? key})
      : super(key: key);

  Widget abortButton() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        padding: const EdgeInsets.all(10),
        onPressed: () => onDelete(cubit.id),
        icon: const Icon(
          Icons.close_rounded,
        ),
      ),
    );
  }

  Widget getImage(ImageProvider? thumbnail) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.grey,
        child: (thumbnail == null)
            ? null
            : Image(
                image: thumbnail,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget loadingTile(ImageProvider? thumbnail, int progress) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(alignment: Alignment.center, children: [
        getImage(thumbnail),
        Text(progress.toString()),
        const CircularProgressIndicator(),
        abortButton()
      ]),
    );
  }

  Widget uploadedTile(ImageProvider? thumbnail) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [getImage(thumbnail), abortButton()],
      ),
    );
  }

  Widget uploadErrorTile(ImageProvider? thumbnail, context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          getImage(thumbnail),
          IconButton(
            iconSize: min(height, width ?? height) / 2,
            icon: const Icon(
              Icons.restart_alt,
            ),
            color: Colors.redAccent,
            onPressed: () => cubit.retryUpload(),
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
        initial: () => loadingTile(null, 0),
        uploading: (_, thumb, progress) => loadingTile(thumb, progress),
        processing: (_, thumb) => loadingTile(thumb, 80),
        uploaded: (thumb, _) => uploadedTile(thumb),
        uploadError: (error, _, thumb) => uploadErrorTile(thumb, context),
      ),
    );
  }
}
