import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/app_cubit/app_cubit.dart';
import '../../../utils/tools.dart';
import '../../../utils/type_aliases.dart';
import '../../error/exception_view.dart';
import '../../illustration_view/illustration_view.dart';
import '../cubit/posts_list_cubit.dart';
import '../widgets/non_paginated_post_list.dart';

class CompactPostsFeed extends StatelessWidget {
  final List<FirestoreId> postIds;
  final PostFilter? filter;
  const CompactPostsFeed({Key? key, required this.postIds, this.filter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: BlocProvider<PostsListCubit>(
                create: (_) => PostsListCubit(postIds, filter: filter),
                child: BlocBuilder<PostsListCubit, PostsListState>(
                    builder: (context, state) => state.when(
                        error: (e) => ExceptionView(exception: e),
                        loading: () => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                        neutral: (p) => p.isEmpty
                            ? const IllustrationView.empty(
                                text: "keine Posts gespeichert")
                            : NonPaginatedPostList(p)))),
          )
        ],
      ),
    );
  }
}
