import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/list_view/list_items/post_feed_image_item.dart';
import '../../../common_widgets/list_view/pagination/cubit/paginated_list_cubit.dart';
import '../../../common_widgets/list_view/pagination/view/paginated_list.dart';
import '../../../models/post/post.dart';
import '../../../services/pagination/post_pagination_service.dart';

class PostDiscoveryFeed extends StatelessWidget {
  const PostDiscoveryFeed({Key? key}) : super(key: key);

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
              child: PaginatedList<Post>(
                itemBuilder: (post) => PostFeedImageItem(
                  post,
                  // ToDo ich habe das gemacht, weil sonst die Liste nicht immer richtig neu gebaut wurde
                  // ich verstehe aber eigentlich zu wenig von keys vielleicht gibt es auch bessere Lösungen
                  key: ValueKey(post.id),
                  height: 350,
                ),
                reverse: false,
                endMessage: "there are no more events",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
