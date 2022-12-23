import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common_widgets/image/user_image/user_image.dart';
import '../../../../../models/post/post.dart';
import '../../../../../utils/tools.dart';
import '../../../../../utils/util_widgets/floating_modal.dart';
import 'cubit/post_members_cubit.dart';

class PostParticipantsView extends StatelessWidget {
  const PostParticipantsView._({Key? key}) : super(key: key);

  static Future<void> openAsModalBottomSheet(BuildContext context, Post post) {
    return showFloatingModalBottomSheet<void>(
        context: context,
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<PostMembersCubit>(
                create: ((_) => PostMembersCubit(post)),
              )
            ], child: const PostParticipantsView._()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              l10n(context).lbl_postMembers,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 13),
          BlocBuilder<PostMembersCubit, PostMembersState>(
              builder: (context, state) => state.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  error: (e) =>
                      Center(child: Text(l10n(context).lbl_loadError)),
                  neutral: (members) => members.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            l10n(context).lbl_postNoMembers,
                            textAlign: TextAlign.center,
                          ))
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: members
                              .map((user) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 20),
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
  }
}