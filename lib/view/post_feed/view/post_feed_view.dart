import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/post_feed/view/post_feed_item_view.dart';
import 'package:flutter/material.dart';

class PostFeedView extends StatelessWidget {
  const PostFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /* ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: */
        ListView.builder(
            clipBehavior: Clip.none,
            itemCount: 4,
            itemBuilder: (_, i) => PostFeedItem());
  }
}
