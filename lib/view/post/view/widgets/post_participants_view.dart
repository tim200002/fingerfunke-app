import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/image/user_image/user_image.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';

class PostParticipantsView extends StatelessWidget {
  const PostParticipantsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
        builder: (context, state) => state.when(
            loading: (_) => const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator.adaptive())),
            normal: (post, isJoining) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        "Teilnehmer",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 13),
                    for (UserInfo info in post.participants)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 20),
                        child: Row(
                          children: [
                            UserImage(
                              info.picture,
                              diameter: 34,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(info.name)
                          ],
                        ),
                      )
                  ],
                ),
              );
            }));
  }
}
