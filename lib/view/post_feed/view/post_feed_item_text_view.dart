import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PostFeedItem extends StatelessWidget {
  static const int imageWidth = 120;
  final Post _post;
  const PostFeedItem(this._post, {Key? key}) : super(key: key);

  Widget _imageSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
          width: imageWidth.toDouble(),
          height: imageWidth.toDouble(),
          child: _post.media.isEmpty
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
                  width: imageWidth,
                  height: imageWidth,
                )),
    );
  }

  Widget _metaSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AuthorInfo(_post.author),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("42", //ToDo: Datamodel does not contain date
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                )),
            Padding(
                padding: EdgeInsets.only(left: 4, right: 5),
                child: Text("Jan.",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.grey)))
          ],
        )
      ],
    );
  }

  Widget _contentSection(BuildContext context) {
    const double padding = 12;
    const double leftOffset = 20;
    return Container(
      constraints: const BoxConstraints(minHeight: imageWidth + padding * 2),
      margin: const EdgeInsets.only(left: leftOffset),
      padding: const EdgeInsets.fromLTRB(
          imageWidth - leftOffset + padding, padding, padding, padding),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _post.title,
            style: AppTheme.textStyleCondensed(
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          ),
          _metaSection(context)
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
            Navigator.pushNamed(context, Routes.post, arguments: _post.id),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            _contentSection(context),
            _imageSection(context),
          ],
        ),
      ),
    );
  }
}
