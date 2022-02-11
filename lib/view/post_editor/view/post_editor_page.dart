import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/view/page_views/post_editing_view.dart';
import 'package:fingerfunke_app/view/post_editor/view/page_views/not_signed_in_view.dart';
import 'package:fingerfunke_app/view/post_editor/view/page_views/post_posted_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditorArguments {
  final Post? post;
  PostEditorArguments({this.post});
}

class PostEditorPage extends StatelessWidget {
  /// pass a postID if you want to edit an existing post
  const PostEditorPage({Key? key}) : super(key: key);

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
              ),
            )
          ],
        ),
      ),
    );
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
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PostEditorArguments? arguments =
        ModalRoute.of(context)!.settings.arguments != null
            ? ModalRoute.of(context)!.settings.arguments as PostEditorArguments
            : null;
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const NotSignedInView(),
        signedIn: (user) => BlocProvider<PostEditorCubit>(
          create: (context) => PostEditorCubit(
              currentUser: user, postToBeEdited: arguments?.post),
          child: BlocBuilder<PostEditorCubit, PostEditorState>(
              buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
              builder: (context, state) => state.when(
                  loading: () => _loading(context, message: "loading"),
                  editEvent: (fields, inputValid) => PostEditingView(
                        editorFields: fields,
                        isEditingExisitingPost:
                            BlocProvider.of<PostEditorCubit>(context)
                                .isEditingExistingPost,
                      ),
                  editGroup: (fields, inputValid) => PostEditingView(
                        editorFields: fields,
                        isEditingExisitingPost:
                            BlocProvider.of<PostEditorCubit>(context)
                                .isEditingExistingPost,
                      ),
                  error: (message) => _error(context),
                  submitted: () => const PostPostedSuccessView(),
                  submitting: () => _loading(context, message: "submitting"))),
        ),
      ),
    );
  }
}
