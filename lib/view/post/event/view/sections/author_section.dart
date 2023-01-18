import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common_widgets/user/user_info_view.dart';
import '../../../../../utils/skeleton_view.dart';
import '../../../../../utils/tools.dart';
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
              normal: (post, _) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        l10n(context).lbl_postCreatedBy(":"),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(height: 10),
                      Center(
                          child: UserInfoView(
                        post.author,
                        vertical: true,
                        margin: const EdgeInsets.all(10),
                      ))
                    ],
                  )),
            ),
          );
  }
}
