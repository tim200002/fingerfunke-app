import 'dart:ui';

import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';

class PostFeedItem extends StatelessWidget {
  final Post _post;
  const PostFeedItem(this._post, {Key? key}) : super(key: key);

  Widget _imageSection(BuildContext context) {
    return Container(
      height: 110,
      color: Colors.teal.shade100,
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _infoSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFFF0F0F0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Tools.dateFromEpoch(
                      _post.creationTime.millisecondsSinceEpoch),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                    Tools.timeFromEpoch(
                            _post.creationTime.millisecondsSinceEpoch) +
                        " Uhr",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              constraints: const BoxConstraints(minHeight: 60),
              child: Text(
                _post.title,
                style: AppTheme.textStyleAccent(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              AuthorInfo(_post.author),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_post.location,
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.location_pin,
                      size: 18,
                    ),
                  )
                ],
              )
            ])
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, postRoute, arguments: _post.id),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            //padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
                /*gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.teal[50]!, Colors.orange[50]!]),
              color: Colors.grey
                  .shade200, //Theme.of(context).colorScheme.secondary.withAlpha(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
              ],*/
                //borderRadius: BorderRadius.circular(10),
                ),
            //margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [_imageSection(context), _infoSection(context)],
            ),
          ),
        ),
      ),
    );
  }
}
