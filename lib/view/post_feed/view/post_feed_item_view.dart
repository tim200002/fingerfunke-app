import 'dart:ui';

import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class PostFeedItem extends StatelessWidget {
  const PostFeedItem({Key? key}) : super(key: key);

  Widget _PLACEHOLDER_authorImage() {
    return Container(
      height: 27,
      width: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: DevTools.colorPlaceholder,
      ),
    );
  }

  Widget _authorInfo(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(right: 6),
          child: _PLACEHOLDER_authorImage()),
      const Text(
        "Maximilia",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, postRoute),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.teal[50]!, Colors.orange[50]!]),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300]!,
                offset: Offset(0, 2),
                spreadRadius: 1,
                blurRadius: 3)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                constraints: BoxConstraints(minHeight: 100),
                child: Text(
                  "This an example title of the event",
                  style: AppTheme.textStyleAccent(
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                )),
            _authorInfo(context)
          ],
        ),
      ),
    );
  }
}
