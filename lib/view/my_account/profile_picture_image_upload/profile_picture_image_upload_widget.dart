import 'dart:io';

import 'package:uuid/uuid.dart';

import '../../../common_widgets/image/user_image/user_image.dart';
import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/floating_modal.dart';
import 'upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureImageUploadWidget extends StatelessWidget {
  const ProfilePictureImageUploadWidget({Key? key}) : super(key: key);
  static const double userImageSize = 65;

  void selectImage(String userId, BuildContext context) {
    showFloatingModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // check if device is ios
          //if (Platform.isIOS)
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: Text(l10n(context).lbl_camera),
            onTap: () async {
              await uploadProfilePictureBase64Encoded(
                  userId, ImageSource.camera, context);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(l10n(context).lbl_imageGallery),
            onTap: () async {
              await uploadProfilePictureBase64Encoded(
                  userId, ImageSource.gallery, context);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAuthenticationCubitCubit.userBuilder((user) {
      return InkWell(
        onTap: () async {
          selectImage(user.id, context);
        },
        child: SizedBox.square(
          dimension: userImageSize,
          child: Stack(
            //fit: StackFit.passthrough,
            children: [
              UserImage(
                user.picture,
                diameter: userImageSize.round().toDouble(),
                // Add key because otherwise will not update correctly
                // when given the picture is a good key, size should only update
                // if picture changes
                key: Key(user.picture ?? const Uuid().v4()),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(200),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.edit, size: 20),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
