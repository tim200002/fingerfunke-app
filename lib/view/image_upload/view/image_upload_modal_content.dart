import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/tools.dart';
import '../cubit/image_upload_cubit.dart';

class ImageUploadModalContent extends StatelessWidget {
  const ImageUploadModalContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageUploadCubit>(
      create: (BuildContext context) {
        return ImageUploadCubit();
      },
      child: const ImageUploadWidget(),
    );
  }
}

class ImageUploadWidget extends StatelessWidget {
  const ImageUploadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploadCubit, ImageUploadState>(
        builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          state.when(
              initial: () => Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.photo_camera),
                        title: Text(l10n(context).lbl_camera),
                        onTap: () {
                          BlocProvider.of<ImageUploadCubit>(context)
                              .pickImage(ImageSource.camera);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: Text(l10n(context).lbl_imageGallery),
                        onTap: () {
                          BlocProvider.of<ImageUploadCubit>(context)
                              .pickImage(ImageSource.gallery);
                        },
                      ),
                    ],
                  ),
              loaded: (file) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.file(
                                    file,
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Icon(Icons.crop),
                              onPressed: () =>
                                  BlocProvider.of<ImageUploadCubit>(context)
                                      .cropImage(),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ImageUploadCubit>(context)
                                    .send();
                                Navigator.of(context).pop();
                              },
                              child: Text(l10n(context).lbl_imageUpload),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
        ],
      );
    });
  }
}
