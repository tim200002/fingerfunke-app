import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/view/post_editor/view/post_editor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSettingsModalContent extends StatelessWidget {
  // I think it is enough to pass post like this, post cannot update now during runtime but I think that is not an issue (open for Discussion)
  final Post post;

  const PostSettingsModalContent({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAuthor = BlocProvider.of<AuthenticationCubit>(context)
        .state
        .maybeWhen(
            signedIn: (currentUser) => currentUser.id == post.author.id,
            orElse: () => false);

    bool isParticipant = BlocProvider.of<AuthenticationCubit>(context)
        .state
        .maybeWhen(
            signedIn: (currentUser) => post.isUserParticipant(currentUser),
            orElse: () => false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.people_rounded),
          title: const Text('Teilnehmer'),
          onTap: () => Navigator.of(context).pop(),
        ),
        if (isAuthor)
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Bearbeiten'),
            onTap: () {
              Navigator.pushNamed(context, Routes.postEditor,
                      arguments: PostEditorArguments(post: post))
                  .then((_) => Navigator.of(context).pop());
            },
          ),
        if (isParticipant && !isAuthor)
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Verlassen'),
            onTap: () {},
          ),
        if (isAuthor)
          ListTile(
            leading: Icon(
              Icons.delete_forever_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Löschen',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () {},
          ),
        if (!isAuthor)
          ListTile(
            leading: Icon(
              Icons.report_gmailerrorred_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text('Melden',
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
            onTap: () => Navigator.of(context).pop(),
          )
      ],
    );
  }
}
