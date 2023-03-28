import 'package:flutter/material.dart';
import '../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../utils/app_theme.dart';
import '../../utils/tools.dart';
import '../post_feed/posts_list_cubit/posts_list_cubit.dart';
import '../post_feed/view/compact_post_feed.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n(context).lbl_savedTitle),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
              left: AppTheme.PADDING_SIDE,
              right: AppTheme.PADDING_SIDE,
              top: 15),
          child: FirebaseAuthenticationCubitCubit.userBuilder((user) =>
              CompactPostsFeed(
                query: () => PostsListCubit.queryPostsByIds(user.savedPosts),
                filter: (posts) =>
                    posts.where((p) => !p.isAuthor(user.id)).toList(),
              ))),
    );
  }
}
