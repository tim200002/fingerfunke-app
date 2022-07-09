import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/common_widgets/list_view/list_item/post_feed_image_item.dart';
import 'package:flutter/material.dart';

class NonPaginatedPostList extends StatelessWidget {
  final List<Post> posts;
  const NonPaginatedPostList(this.posts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: posts.length,
        itemBuilder: (context, index) =>
            PostFeedImageItem(posts[index], key: ValueKey(posts[index].id)));
  }
}
