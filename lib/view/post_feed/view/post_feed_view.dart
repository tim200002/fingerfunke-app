import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/services/pagination/post_pagination_service.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/paginated_list/view/paginated_list.dart';
import 'package:fingerfunke_app/view/post_feed/view/post_feed_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostFeedView extends StatelessWidget {
  const PostFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocProvider(
        create: (context) => PaginatedListCubit<Post>(paginationService: PostPaginationService(),
      ),
      child: PaginatedList<Post>(
      itemBuilder: (post) => PostFeedItem(
        post,
      ),
      reverse: false,
      endMessage: "there are no more events",
      ),
      ) 
    );
  }
}
