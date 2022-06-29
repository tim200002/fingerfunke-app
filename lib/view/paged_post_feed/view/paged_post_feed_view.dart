import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/services/pagination/post_pagination_service.dart';
import 'package:fingerfunke_app/utils/illustration.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../post_feed/view/post_feed_item_image_view.dart';
import 'paged_paginated_list.dart';

class PagedPostFeedView extends StatelessWidget {
  const PagedPostFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => PaginatedListCubit<Post>(
                paginationService: PostPaginationService(),
              ),
              child: PagedPaginatedList<Post>(
                itemBuilder: (post) => PostFeedImageItem(
                  post,
                  key: ValueKey(post.id),
                ),
                reverse: false,
                endIndicator: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Illustration(
                        Illustrations.empty,
                        height: null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "keine weiteren Events",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
