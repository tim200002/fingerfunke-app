import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class VideoUploadTile extends StatelessWidget {
  final double height;

  final VideoUploadCubit cubit;

  final Function(String) onDelete;

  static const double abortButtonRadius = 20;

  const VideoUploadTile(
      {required this.cubit,
      required this.height,
      required this.onDelete,
      Key? key})
      : super(key: key);

  Widget abortButton() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: IconButton(
            padding: const EdgeInsets.all(10),
            onPressed: () => onDelete(cubit.id),
            icon: const Icon(
              FeatherIcons.trash2,
            ),
          ),
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
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget loadingTile(
      BuildContext context, ImageProvider? thumbnail, int progress) {
    double size = 50;
    return Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
      getImage(thumbnail),
      Center(
        child: Container(
          height: size + 10,
          width: size + 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((size + 10) / 2),
              color: Theme.of(context).colorScheme.background.withOpacity(0.4)),
        ),
      ),
      Center(
          child: Text(
        "$progress %",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary),
      )),
      const Center(
          child: SizedBox.square(
              dimension: 50, child: CircularProgressIndicator())),
      abortButton()
    ]);
  }

  Widget uploadedTile(ImageProvider? thumbnail) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [getImage(thumbnail), abortButton()],
    );
  }

  Widget uploadErrorTile(ImageProvider? thumbnail, context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        getImage(thumbnail),
        Center(
          child: IconButton(
            iconSize: height / 2,
            icon: const Icon(
              Icons.restart_alt,
            ),
            color: Colors.redAccent,
            onPressed: () => cubit.retryUpload(),
          ),
        ),
        abortButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height,
      child: BlocBuilder<VideoUploadCubit, VideoUploadState>(
        bloc: cubit,
        builder: (context, state) => state.when(
          initial: () => loadingTile(context, null, 0),
          uploading: (_, thumb, progress) =>
              loadingTile(context, thumb, progress),
          processing: (_, thumb) => loadingTile(context, thumb, 80),
          uploaded: (thumb, _) => uploadedTile(thumb),
          uploadError: (error, _, thumb) => uploadErrorTile(thumb, context),
        ),
      ),
    );
  }
}
