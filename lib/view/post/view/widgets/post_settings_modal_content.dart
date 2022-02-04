import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSettingsModalContent extends StatelessWidget {
  final BuildContext externalContext;

  const PostSettingsModalContent({Key? key, required this.externalContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthenticationCubit>(externalContext),
      child: BlocProvider.value(
        value: BlocProvider.of<PostCubit>(externalContext),
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, authState) {
          return BlocBuilder<PostCubit, PostState>(builder: (ctx, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.people_rounded),
                  title: const Text('Teilnehmer'),
                  onTap: () => Navigator.of(context).pop(),
                ),
                authState.maybeWhen(
                    signedIn: (auth) {
                      return state.when(
                        loading: (postId) => const CircularProgressIndicator(),
                        normal: (file) {
                          if (file.author.id == auth.id) {
                            return Column(children: [
                              ListTile(
                                leading: const Icon(Icons.edit),
                                title: const Text('Bearbeiten'),
                                onTap: () => Navigator.of(context).pop(),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.delete_forever_rounded,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                title: Text(
                                  'Löschen',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ),
                                onTap: () {},
                              ),
                            ]);
                          } else {
                            return ListTile(
                              leading: Icon(
                                Icons.report_gmailerrorred_rounded,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              title: Text('Melden',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error)),
                              onTap: () => Navigator.of(context).pop(),
                            );
                          }
                        },
                      );
                    },
                    orElse: () => Container()),
              ],
            );
          });
        }),
      ),
    );
  }
}
