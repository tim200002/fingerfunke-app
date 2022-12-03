import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/tools.dart';
import '../../error/exception_view.dart';
import '../../illustration_view/illustration_view.dart';
import '../posts_list_cubit/posts_list_cubit.dart';
import '../widgets/non_paginated_post_list.dart';

class CompactPostsFeed extends StatelessWidget {
  final PostQuery query;
  final PostFilter? filter;
  final String? emptyMessage;
  const CompactPostsFeed(
      {Key? key, required this.query, this.emptyMessage, this.filter})
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
                create: (_) => PostsListCubit(query, filter: filter),
                child: BlocBuilder<PostsListCubit, PostsListState>(
                    builder: (context, state) => state.when(
                        error: (e) => ExceptionView(exception: e),
                        loading: () => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                        neutral: (p) => p.isEmpty
                            ? IllustrationView.empty(
                                text: emptyMessage ?? l10n(context).lbl_noPosts)
                            : NonPaginatedPostList(p)))),
          )
        ],
      ),
    );
  }
}
