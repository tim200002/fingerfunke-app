import 'dart:math';
import 'dart:typed_data';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoUploadTile extends StatelessWidget {
  final Function(String) onAbort;
  final double height;
  final double width;

  final VideoUploadCubit cubit;

  static const double abortButtonRadius = 20;

  const VideoUploadTile(
      {required this.cubit,
      required this.onAbort,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  Widget abortButton() {
    return Align(
      alignment: Alignment.topRight,
      child: /*Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: */
          IconButton(
        padding: EdgeInsets.all(10),
        onPressed: () => onAbort(cubit.id),
        icon: const Icon(
          Icons.close_rounded,
        ),
      ),
    );
  }

  Widget getImage(Uint8List? thumbnail) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: Colors.grey,
            child: (thumbnail == null)
                ? null
                : Image(
                    image: MemoryImage(thumbnail),
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                  )));
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
        initial: () => loadingTile(null),
        uploading: (_, thumb) => loadingTile(thumb),
        processing: (_, thumb) => loadingTile(thumb),
        uploaded: (thumb, _) => uploadedTile(thumb),
        error: (error, thumb, _) => errorTile(thumb, context),
      ),
    );
  }
}
