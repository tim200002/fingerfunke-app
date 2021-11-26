import 'dart:ui';

import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class PostFeedItem extends StatelessWidget {
  final Post _post;
  const PostFeedItem(this._post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, postRoute),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.teal[50]!, Colors.orange[50]!]),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300]!,
                offset: const Offset(0, 2),
                spreadRadius: 1,
                blurRadius: 3)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                constraints: const BoxConstraints(minHeight: 100),
                child: Text(
                  _post.title,
                  style: AppTheme.textStyleAccent(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            AuthorInfo(_post.author)
          ],
        ),
      ),
    );
  }
}
