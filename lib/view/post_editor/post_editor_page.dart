import 'dart:io';

import 'package:fingerfunke_app/common_widgets/upload/video_upload_tile.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_proto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditorPage extends StatelessWidget {
  const PostEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) => state.maybeWhen(
        signedIn: (currentUser) => BlocProvider(
          create: (context) => PostEditorProtoCubit(currentUser),
          child: Builder(
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: BlocBuilder<PostEditorProtoCubit, PostEditorProtoState>(
                  builder: (context, state) {
                return Column(
                  children: state.videoUploadCubits.map((videoUploadCubit) {
                    return VideoUploadTile(
                      cubit: videoUploadCubit,
                      onAbort: (id) {BlocProvider.of<PostEditorProtoCubit>(context).deleteVideo(id);},
                      width: 200,
                      height: 200,
                    );
                  }).toList(),
                );
              }),
              floatingActionButton: FutureBuilder(
                future:Tools.getImageFileFromAssets('vid/mux_test_video.mp4'),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else { 
                    return  FloatingActionButton(onPressed: ()=>BlocProvider.of<PostEditorProtoCubit>(context).addVideo(snapshot.data as File));
                  }
                }
              ),
            ),
          ),
        ),
        orElse: () => Container(),
      ),
    );
  }
}

/**
floatingActionButton: FutureBuilder(
future:
    Tools.getImageFileFromAssets('vid/mux_test_video.mp4'),
builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Container();
  } else { 
    return BlocBuilder FloatingActionButton(onPressed: ()=>BlocProvider.of<PostEditorProtoCubit>(context).addVideo(snapshot.data as File, ))
  }}
  )
 */