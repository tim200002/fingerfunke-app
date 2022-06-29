import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../report_send/report_send_page.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';

class PostSettingsModalContent extends StatelessWidget {
  const PostSettingsModalContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
        builder: (context, state) => state.when(
            loading: (_) => const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator.adaptive())),
            normal: (post, isJoining) {
              bool isAuthor = post
                  .isUserAuthor(BlocProvider.of<AppCubit>(context).state.user);

              bool isParticipant = post.isUserParticipant(
                  BlocProvider.of<AppCubit>(context).state.user);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.people_rounded),
                    title: const Text('Teilnehmer'),
                    onTap: () => DevTools.showToDoSnackbar(context),
                  ),
                  if (isAuthor)
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Bearbeiten'),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.postEditor,
                                arguments: post)
                            .then((_) => Navigator.of(context).pop());
                      },
                    ),
                  if (isParticipant && !isAuthor)
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Verlassen'),
                      onTap: () => DevTools.showToDoSnackbar(context),
                    ),
                  if (isAuthor)
                    ListTile(
                      leading: Icon(
                        Icons.delete_forever_rounded,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      title: Text(
                        'Löschen',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                      onTap: () => context.read<PostCubit>().deletePost(),
                    ),
                  if (!isAuthor)
                    ListTile(
                      leading: Icon(
                        Icons.report_gmailerrorred_rounded,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      title: Text('Melden',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error)),
                      onTap: () {
                        Navigator.pop(context);
                        ReportSendPage.navigate(context, post);
                      },
                    )
                ],
              );
            }));
  }
}
