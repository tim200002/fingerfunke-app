import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/services/pagination/post_pagination_service.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/paginated_list/view/paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_feed_item_image_view.dart';

class PostFeedView extends StatelessWidget {
  const PostFeedView({Key? key}) : super(key: key);

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
