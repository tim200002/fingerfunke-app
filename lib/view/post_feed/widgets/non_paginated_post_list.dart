import '../../../common_widgets/list_view/list_items/post_feed_image_item.dart';
import '../../../models/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/posts_list_cubit.dart';

class NonPaginatedPostList extends StatelessWidget {
  final List<Post> posts;
  final double itemMinHeight;
  const NonPaginatedPostList(this.posts, {Key? key, this.itemMinHeight = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) => PostFeedImageItem(posts[index],
          height: itemMinHeight, key: ValueKey(posts[index].id)),
    );
  }
}
