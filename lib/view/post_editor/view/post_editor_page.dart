import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/view/post_editing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditorPage extends StatelessWidget {
  /// pass a postID if you want to edit an existing post
  const PostEditorPage({Key? key, String? postID}) : super(key: key);

  Widget _loading(BuildContext context, {required String message}) {
    return Scaffold(
        body: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator.adaptive(),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ))
      ],
    )));
  }

  Widget _success(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("Post erstellt!"),
        ));
  }

  Widget _error(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.warning_rounded, color: Colors.red), //TODO fix color
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Error saving post",
              textAlign: TextAlign.center,
            ))
      ],
    )));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostEditorCubit>(
      create: (context) => PostEditorCubit(),
      child: BlocConsumer<PostEditorCubit, PostEditorState>(
          listener: (context, state) =>
              state.whenOrNull(submitted: () => Navigator.of(context).pop()),
          builder: (context, state) => state.when(
              loading: () => _loading(context, message: "loading"),
              editing: (post, _) => PostEditingView(post: post),
              error: (message) => _error(context),
              submitted: () => _success(context),
              submitting: () => _loading(context, message: "submitting"))),
    );
  }
}
