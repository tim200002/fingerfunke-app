import '../../../common_widgets/list_view/list_items/post_feed_image_item.dart';
import '../../../models/post/post.dart';
import '../cubit/saved_posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NonPaginatedPostList extends StatelessWidget {
  final List<Post> posts;
  const NonPaginatedPostList(this.posts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: posts.length,
        itemBuilder: (context, index) => PostFeedImageItem(posts[index],
            onNavigatedBackToThisItem: (postId) =>
                BlocProvider.of<SavedPostsCubit>(context).refetchPost(postId),
            key: ValueKey(posts[index].id)));
  }
}
