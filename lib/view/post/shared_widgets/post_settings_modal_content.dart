import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../models/post/post.dart';
import '../../../../routes.dart';
import '../../../../utils/dev_tools.dart';
import '../../../../utils/tools.dart';
import '../../../../utils/util_widgets/floating_modal.dart';
import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../report_send/post_report_send_page.dart';
import '../cubits/post_viewer_cubit/post_cubit.dart';
import 'post_participants.dart/post_participants_view.dart';

class PostSettingsModalContent extends StatelessWidget {
  const PostSettingsModalContent._({Key? key}) : super(key: key);

  static Future<void> openAsModalBottomSheet(BuildContext context) {
    return showFloatingModalBottomSheet<void>(
        context: context,
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<PostCubit>.value(
                value: context.read<PostCubit>(),
              )
            ], child: const PostSettingsModalContent._()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
        builder: (context, state) => state.when(
            loading: (_) => const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator.adaptive())),
            normal: (post, isMember) {
              bool isAuthor = post.isUserAuthor(
                  BlocProvider.of<FirebaseAuthenticationCubitCubit>(context)
                      .getUser()
                      .toInfo());

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: const Icon(FeatherIcons.users),
                      title: Text(l10n(context).lbl_postMembers),
                      onTap: () {
                        Navigator.of(context).pop();
                        PostParticipantsView.openAsModalBottomSheet(
                            context, post);
                      }),
                  if (isAuthor &&
                      (!post.isEvent || !(post as Event).isCompleted))
                    ListTile(
                      leading: const Icon(FeatherIcons.edit),
                      title: Text(l10n(context).lbl_edit),
                      onTap: () {
                        // pop the modal
                        Navigator.pop(context);

                        // pop current scree and replace with editor
                        Navigator.of(context).popAndPushNamed(Routes.postEditor,
                            arguments: post);
                      },
                    ),
                  if (isMember && !isAuthor)
                    ListTile(
                      leading: const Icon(FeatherIcons.logOut),
                      title: Text(l10n(context).lbl_leavePost),
                      onTap: () => DevTools.showToDoSnackbar(context),
                    ),
                  if (isAuthor)
                    ListTile(
                      leading: Icon(
                        Icons.delete_forever_rounded,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      title: Text(
                        l10n(context).lbl_delete,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                      onTap: () async {
                        // must be accessed here because build context is invalid thereafter
                        final PostCubit cubit = context.read<PostCubit>();
                        final String message = l10n(context).msg_postDeleted;
                        // close post first 
                        Navigator.of(context).pop();
                        // then delete it
                        await cubit.deletePost();
                        Tools.showSnackbar(message);
                      },
                    ),
                  if (!isAuthor)
                    ListTile(
                      leading: Icon(
                        Icons.report_gmailerrorred_rounded,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      title: Text(l10n(context).lbl_report,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error)),
                      onTap: () {
                        Navigator.pop(context);
                        PostReportSendPage.navigate(context, post);
                      },
                    )
                ],
              );
            }));
  }
}
