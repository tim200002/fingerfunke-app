import 'dart:ui';

import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';

class PostFeedItemBlur extends StatelessWidget {
  static const heroTag = "postcard_img";

  final Post _post;
  const PostFeedItemBlur(this._post, {Key? key}) : super(key: key);

  Widget _postImage(BuildContext context) {
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
            width: MediaQuery.of(context).size.width.toInt(),
          );
  }

  Widget _locationInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_post.location, style: TextStyle(fontWeight: FontWeight.w600)),
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.location_pin,
            size: 18,
          ),
        )
      ],
    );
  }

  Widget _dateInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Tools.dateFromEpoch(_post.creationTime.millisecondsSinceEpoch),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
            " / " +
                Tools.timeFromEpoch(_post.creationTime.millisecondsSinceEpoch) +
                " Uhr",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _infoSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _post.title,
              style: AppTheme.textStyleAccent(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [AuthorInfo(_post.author), _dateInfo()])
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(offset: Offset(0, 2), blurRadius: 10, spreadRadius: -7)
        ], borderRadius: BorderRadius.circular(5)),
        child: InkWell(
            onTap: () =>
                Navigator.pushNamed(context, postRoute, arguments: _post.id),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 150,
                child: Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.7), BlendMode.hardLight),
                      child: Hero(
                          tag: PostFeedItemBlur.heroTag,
                          child: _postImage(context)),
                    ),
                    BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 40.0,
                            sigmaY: 40.0,
                            tileMode: TileMode.repeated),
                        child: _infoSection(context)),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
