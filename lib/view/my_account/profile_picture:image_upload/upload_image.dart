import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<void> uploadProfilePictureBase64Encoded(
    String userId, ImageSource source, BuildContext context,
    {UserRepository? userRepo}) async {
  final UserRepository userRepository = userRepo ?? UserRepositoryImpl();
  // choose file
  XFile? file = await ImagePicker().pickImage(source: source);
  if (file == null) {
    return;
  }
  // crop File to right aspect ration
  File? cropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 90,
      compressFormat: ImageCompressFormat.jpg);
  if (cropped == null) {
    return;
  }

  // process file
  Uint8List imagebytes = await cropped.readAsBytes();
  String base64String = base64Encode(imagebytes);
  String dataUrl = "data:image/jpeg;base64,$base64String";
  ImageAsset image =
      ImageAsset.createWithId(downloadUrl: dataUrl, state: asset_state.ready);

  await showDialog(
      context: context,
      builder: (context) {
        userRepository
            .updateUser(userId, picture: image)
            .then((_) => Navigator.of(context).pop());
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      });
}
