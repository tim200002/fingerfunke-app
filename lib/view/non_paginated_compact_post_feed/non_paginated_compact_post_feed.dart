import 'dart:async';

import 'package:flutter/material.dart';

import '../../common_widgets/list_items/post_feed_image_item.dart';
import '../../models/post/post.dart';
import '../error/exception_view.dart';

/// A widget that shows a list of posts without pagination.
/// 
/// This widget can be used for use cases where the expected number of
/// posts is small enough to be displayed in one page. THis is for example the case
/// for the "My Posts" view.
class NonPaginatedCompactPostFeed extends StatelessWidget {
  final Stream<List<Post>> stream;
  final Widget loadingIndicator;
  final Widget emptyIndicator;
  const NonPaginatedCompactPostFeed(
      {required this.stream,
      required this.loadingIndicator,
      required this.emptyIndicator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ExceptionView(exception: snapshot.error);
          }
          if (snapshot.hasData) {
            if ((snapshot.data! as List<Post>).isEmpty) {
              return emptyIndicator;
            }
            return _NonPaginatedPostList(snapshot.data as List<Post>);
          }
          return loadingIndicator;
        });
  }
}

class _NonPaginatedPostList extends StatelessWidget {
  final List<Post> posts;
  final double itemMinHeight;
  const _NonPaginatedPostList(this.posts, {Key? key, this.itemMinHeight = 250})
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
