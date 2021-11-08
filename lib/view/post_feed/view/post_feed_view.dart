import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class PostFeedView extends StatelessWidget {
  const PostFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DevTools.placeholder("PostFeed"));
  }
}
