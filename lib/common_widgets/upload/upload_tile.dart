import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../cubits/upload/file_upload_cubit.dart';
import '../../cubits/upload/file_upload_state.dart';

class UploadTile extends StatelessWidget {
  final double height;
  final double? width;

  final FileUploadCubit cubit;

  final Function(String) onDelete;

  static const double abortButtonRadius = 20;
  const UploadTile(
      {required this.cubit,
      required this.height,
      this.width,
      required this.onDelete,
      super.key});

  Widget _abortButton() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: IconButton(
            padding: const EdgeInsets.all(10),
            onPressed: () {
              print("delete");
              onDelete(cubit.id);
            } ,
            icon: const Icon(
              FeatherIcons.trash2,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getImage(ImageProvider? thumbnail) {
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

  Widget loadingTile(
      BuildContext context, ImageProvider? thumbnail, int progress) {
    double size = 50;
    return Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
      _getImage(thumbnail),
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
          child: Text("$progress %",
              style: Theme.of(context).textTheme.labelMedium)),
      const Center(
          child: SizedBox.square(
              dimension: 50, child: CircularProgressIndicator())),
      _abortButton()
    ]);
  }

  Widget uploadedTile(ImageProvider? thumbnail) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [_getImage(thumbnail), _abortButton()],
    );
  }

  Widget uploadErrorTile(ImageProvider? thumbnail, context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        _getImage(thumbnail),
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
        _abortButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: BlocBuilder<FileUploadCubit, FileUploadState>(
        bloc: cubit,
        builder: (context, state) => state.when(
          initial: () => loadingTile(context, null, 0),
          uploading: (progress) =>
              loadingTile(context, cubit.thumbnail, progress),
          processing: () => loadingTile(context, cubit.thumbnail, 80),
          uploaded: (_) => uploadedTile(cubit.thumbnail),
          uploadError: (error) => uploadErrorTile(cubit.thumbnail, context),
        ),
      ),
    );
  }
}
