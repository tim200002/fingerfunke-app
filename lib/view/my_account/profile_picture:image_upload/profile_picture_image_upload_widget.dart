import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/utils/util_widgets/floating_modal.dart';
import 'package:fingerfunke_app/view/my_account/profile_picture:image_upload/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Camera'),
            onTap: () async {
              await uploadProfilePictureBase64Encoded(
                  userId, ImageSource.camera, context);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () async {
              await uploadProfilePictureBase64Encoded(
                  userId, ImageSource.gallery, context);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return InkWell(
        onTap: () async {
          selectImage(state.user.id, context);
        },
        child: SizedBox.square(
          dimension: userImageSize,
          child: Stack(
            //fit: StackFit.passthrough,
            children: [
              UserImage(
                state.user.picture?.downloadUrl,
                diameter: userImageSize.round(),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(200),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.edit, size: 20)))
            ],
          ),
        ),
      );
    });
  }
}