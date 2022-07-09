import '../../../common_widgets/list_view/pagination/cubit/paginated_list_cubit.dart';
import '../../../models/post/post.dart';
import '../../../services/pagination/post_pagination_service.dart';
import '../../../utils/illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/list_view/list_items/post_feed_image_item.dart';
import '../../../common_widgets/list_view/pagination/view/paged_paginated_list.dart';

class PagedPostDiscoveryFeed extends StatelessWidget {
  const PagedPostDiscoveryFeed({Key? key}) : super(key: key);

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
