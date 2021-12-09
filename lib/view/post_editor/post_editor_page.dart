import 'dart:io';

import 'package:fingerfunke_app/common_widgets/upload/video_upload_tile.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditorPage extends StatelessWidget {
  const PostEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) => state.maybeWhen(
            signedIn: (currentUser) => Center(
              child: FutureBuilder(
                future: Tools.getImageFileFromAssets('vid/mux_test_video.mp4'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading Video");
                  } else {
                    return VideoUploadTile(
                      snapshot.data as File,
                      currentUser,
                      width: 100,
                      height: 100,
                    );
                  }
                },
              ),
            ),
            orElse: () => ErrorWidget(
              InvalidPermissionException(),
            ),
          ),
        ));
  }
}
