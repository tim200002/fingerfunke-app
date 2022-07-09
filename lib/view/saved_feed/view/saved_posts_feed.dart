import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/app_cubit/app_cubit.dart';
import '../cubit/saved_posts_cubit.dart';
import '../widgets/non_paginated_post_list.dart';

class SavedPostsFeed extends StatelessWidget {
  const SavedPostsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: BlocProvider<SavedPostsCubit>(
              create: (_) => SavedPostsCubit(),
              child: Builder(builder: (context) {
                //  Create a listener for changes to the savedPosts list
                return BlocListener<AppCubit, AppState>(
                  listener: ((context, state) =>
                      BlocProvider.of<SavedPostsCubit>(context)
                          .updatePosts(state.user.savedPosts)),
                  child: BlocBuilder<SavedPostsCubit, SavedPostsState>(
                    builder: (context, state) => state.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loadedButNothingSaved: () => const Center(
                          child:
                              Text("If you saved posts they will appear here")),
                      loaded: (posts) => NonPaginatedPostList(posts),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
