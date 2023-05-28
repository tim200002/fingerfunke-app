import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/tools.dart';

Future<void> uploadProfilePictureBase64Encoded(
    String userId, ImageSource source, BuildContext context,
    {UserRepository? userRepo}) async {
  final UserRepository userRepository = userRepo ?? UserRepositoryImpl();
  // choose file
  XFile? file = await ImagePicker().pickImage(source: source);

  if (file == null) {
    Tools.showSnackbar("You did not select anything");
    return;
  }
  // crop File to right aspect ration
  CroppedFile? cropped = await ImageCropper().cropImage(
    maxWidth: 400,
    sourcePath: file.path,
    cropStyle: CropStyle.circle,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  );


  // abort
  if (cropped == null) {
    return;
  }

  await showDialog(
    context: context,
    builder: (context) {
      // some async operations to compress and upload image
      () async {
        // ifrst reduce the quality
        Uint8List? imagebytes = await FlutterImageCompress.compressWithFile(
            cropped.path,
            quality: 10);

        if (imagebytes == null) {
          // Something went wrong wile cropping
          Tools.showSnackbar(
              "Something went wrong cropping your image, please try again!");
          return Navigator.of(context).pop();
        }

        // Convert to Base64 String
        String base64String = base64Encode(imagebytes);
        String dataUrl = "data:image/jpeg;base64,$base64String";

        // check that data url fits in max length allowed by firebase i.e. 1048487
        if (dataUrl.length > 1048487) {
          logger.e("Data URL to long to sucessfully transmit file to firebase");
          Tools.showSnackbar(
              "Your Image size is too large to be used as a profile picture");
          Navigator.of(context).pop();
        }

        await userRepository.updateUser(userId, picture: dataUrl);
        logger.d("update finished");

        Navigator.of(context).pop();
      }();

      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    },
  );
}
