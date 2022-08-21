import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/image/user_image/user_image.dart';
import '../../../../models/user/user.dart';
import '../../../../utils/tools.dart';
import '../../../../utils/util_cubits/stream/stream_subscribe_cubit.dart';
import '../../../../utils/util_widgets/floating_modal.dart';
import '../../cubits/post_member_cubit/post_member_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';

class PostParticipantsView extends StatelessWidget {
  const PostParticipantsView._({Key? key}) : super(key: key);

  static Future<void> openAsModalBottomSheet(BuildContext context) {
    return showFloatingModalBottomSheet<void>(
        context: context,
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<PostMemberCubit>.value(
                  value: context.read<PostMemberCubit>()),
              BlocProvider<PostCubit>.value(
                value: context.read<PostCubit>(),
              )
            ], child: const PostParticipantsView._()));
  }

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
                        l10n(context).lbl_postMembers,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 13),
                    BlocBuilder<PostMemberCubit,
                            StreamSubscribeState<List<UserInfo>>>(
                        builder: (context, state) => state.when(
                            loading: () => const Center(
                                child: CircularProgressIndicator.adaptive()),
                            error: (e) =>
                                const Center(child: Text("Fehler beim Laden")),
                            neutral: (members) => members.isEmpty
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      "keine Teilnehmer",
                                      textAlign: TextAlign.center,
                                    ))
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: members
                                        .map((user) => Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  UserImage(
                                                    user.picture,
                                                    diameter: 34,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(user.name)
                                                ],
                                              ),
                                            ))
                                        .toList())))
                  ],
                ),
              );
            }));
  }
}
