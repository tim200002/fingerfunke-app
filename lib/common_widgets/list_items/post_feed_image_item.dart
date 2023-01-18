import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import '../user/user_info_view.dart';
import '../../../../../../common_widgets/video/video_playback_cubit/video_playback_cubit.dart';
import '../../../../../../common_widgets/video/view/video_playback_view.dart';
import '../../../../../../models/asset/asset.dart';
import '../../../../../../models/post/post.dart';
import '../../../../../../repositories/video_repository/video_repository.impl.dart';
import '../../../../../../routes.dart';
import '../../../../../../utils/app_theme.dart';
import '../../../../../../utils/extensions/date_time.dart';
import '../../../../../../utils/tools.dart';
import '../../../../../../utils/type_aliases.dart';
import '../../utils/skeleton_view.dart';
import 'in_past_filter.dart';

part "feed_item_loading.dart";

class PostFeedImageItem extends StatelessWidget {
  final Post _post;
  final double? height;
  final bool video;

  /// From here one can navigate to a detailed post view, this function is called when
  /// returning back from this detail view to then do any necessary actions
  /// (e.g. reload current post in case changes have been done on the detail page)
  final void Function(FirestoreId postId)? onNavigatedBackToThisItem;

  /// a loading UI version of this Widget
  static Widget loading() => const _FeedItemLoading();

  const PostFeedImageItem(this._post,
      {Key? key,
      this.height,
      this.onNavigatedBackToThisItem,
      this.video = false})
      : super(key: key);

  Widget _videoBackgroundView(BuildContext context) {
    Widget videoPlayback = VideoPlaybackView(
      fit: BoxFit.cover,
      thumbnail: _imageBackgroundView(context),
    );
    return BlocProvider(
        create: (context) => VideoPlaybackCubit.network(
            url: VideoRepositoryImpl().createPlaybackUrl((_post.media
                .firstWhere((e) => e.type == AssetType.video) as VideoAsset)),
            autoplay: true,
            loop: false),
        child: videoPlayback);
  }

  Widget _imageBackgroundView(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return NetworkPlaceholderImage(
      VideoRepositoryImpl().createThumbnailUrl(_post.media[0] as VideoAsset),
      Container(
        color: Colors.grey,
      ),
      fit: BoxFit.cover,
      width: width.toInt(),
      height: height?.toInt(),
      //height: (width ~/ aspectRatio),
    );
  }

  Widget _backgroundView(BuildContext context) {
    return _post.media.isEmpty
        ? const Center(
            child: Icon(
              Icons.image,
              color: Colors.white,
            ),
          )
        : InPastFilter(
            isInPast: _post.asEvent?.isCompleted ?? false,
            child: video
                ? _videoBackgroundView(context)
                : _imageBackgroundView(context));
  }

  Widget _eventDateWidget(BuildContext context) {
    final Event event = _post as Event;
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(minWidth: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: event.startTime.isBefore(DateTime.now())
          ? Text(l10n(context).lbl_post_inPast,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ))
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    event.startTime.day
                        .toString(), //ToDo: Datamodel does not contain date
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    )),
                Text(event.startTime.monthAsAbbreviatedString,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.grey))
              ],
            ),
    );
  }

  Widget _contentSection(BuildContext context) {
    const double padding = 18;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(padding, 100, padding, padding),
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
          mainAxisSize: MainAxisSize.min,
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
            UserInfoView(
              _post.author,
              color: Colors.white,
              compact: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, Routes.post, arguments: _post.id)
                .then((_) => onNavigatedBackToThisItem?.call(_post.id)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(21),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _backgroundView(context),
              _contentSection(context),
              if (_post is Event)
                Positioned(
                  top: 18,
                  right: 18,
                  child: _eventDateWidget(context),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
