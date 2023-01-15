import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/skeleton_view.dart';
import '../../../../../utils/tools.dart';
import '../../../../user_profile/profile_view.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';

/// shows information about the author of the post.
/// In [editing] mode, nothing is shown
class AuthorSection extends StatelessWidget {
  final bool editing;
  const AuthorSection(this.editing, {Key? key}) : super(key: key);

  Widget _loading() {
    return const SkeletonView.headline(
      alignment: Alignment.center,
      margin: EdgeInsets.all(12),
      width: 120,
    );
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? Container() // show nothing on editing
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
              loading: (_) => SkeletonView.shimmer(_loading()),
              normal: (post, _) => Center(
                child: InkWell(
                  onTap: () => UserProfileView.showAsBottomSheet(context,
                      userId: post.author.id),
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        l10n(context).lbl_postCreatedBy(post.author.name),
                        style: Theme.of(context).textTheme.caption,
                      )),
                ),
              ),
            ),
          );
  }
}
