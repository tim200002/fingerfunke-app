import 'package:fingerfunke_app/models/post/post.dart';
import 'package:flutter/material.dart';

class PostDescriptionSection extends StatelessWidget {
  final Post post;
  const PostDescriptionSection(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        post.description,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
