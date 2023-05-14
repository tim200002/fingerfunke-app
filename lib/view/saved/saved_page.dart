import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../repositories/post_repository/post_repository.dart';
import '../../utils/app_theme.dart';
import '../../utils/tools.dart';
import '../illustration_view/illustration_view.dart';
import '../non_paginated_compact_post_feed/non_paginated_compact_post_feed.dart';

class SavedPage extends StatelessWidget {
  final PostRepository _postRepository = GetIt.I.get<PostRepository>();
  SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n(context).lbl_savedTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppTheme.PADDING_SIDE, right: AppTheme.PADDING_SIDE, top: 15),
        child: FirebaseAuthenticationCubitCubit.userBuilder(
          (user) => NonPaginatedCompactPostFeed(
              stream: _postRepository.observePosts(user.savedPosts),
              loadingIndicator: const CircularProgressIndicator(),
              emptyIndicator:
                  IllustrationView.empty(text: l10n(context).lbl_noSavedPosts)),
        ),
      ),
    );
  }
}
