import 'dart:io';

import 'package:fingerfunke_app/common_widgets/upload/video_upload_tile.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';

class PostEditorPage extends StatelessWidget {
  const PostEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: Tools.getImageFileFromAssets('vid/mux_test_video.mp4'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading Video");
            } else {
              return VideoUploadTile(snapshot.data as File);
            }
          },
        ),
      ),
    );
  }
}
