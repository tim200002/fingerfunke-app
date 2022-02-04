import 'dart:ui';

import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PostFeedImageItem extends StatelessWidget {
  final Post _post;
  const PostFeedImageItem(this._post, {Key? key}) : super(key: key);

  Widget _imageSection(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double aspectRatio = 2.5 / 2;
    return _post.media.isEmpty
        ? const Center(
            child: Icon(
              Icons.image,
              color: Colors.white,
            ),
          )
        : NetworkPlaceholderImage(
            VideoRepositoryImpl()
                .createThumbnailUrl(_post.media[0] as VideoAsset),
            Container(
              color: Colors.grey,
            ),
            fit: BoxFit.cover,
            width: width.toInt(),
            height: (width ~/ aspectRatio),
          );
  }

  Widget _dateWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(minWidth: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("42", //ToDo: Datamodel does not contain date
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              )),
          Padding(
              padding: EdgeInsets.only(),
              child: Text("Jan",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.grey)))
        ],
      ),
    );
  }

  Widget _contentSection(BuildContext context) {
    const double padding = 12;
    return Container(
      padding: EdgeInsets.fromLTRB(padding, 100, padding, padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _post.title,
            style: AppTheme.textStyleCondensed(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.white)),
          ),
          const SizedBox(
            height: 9,
          ),
          AuthorInfo(
            _post.author,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
          onTap: () =>
              Navigator.pushNamed(context, postRoute, arguments: _post.id),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                _imageSection(context),
                Positioned(
                  top: 10,
                  right: 10,
                  child: _dateWidget(context),
                ),
                _contentSection(context),
              ]))),
    );
  }
}
