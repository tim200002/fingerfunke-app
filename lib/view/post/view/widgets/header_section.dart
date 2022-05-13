import 'package:auto_size_text/auto_size_text.dart';
import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/floating_modal.dart';
import 'package:fingerfunke_app/view/fullscreen_video/view/fullscreen_video_page.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_app_bar_button.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_settings_modal_content.dart';
import 'package:fingerfunke_app/view/post/view/widgets/visibility_controller.dart';
import 'package:fingerfunke_app/view/post_feed/view/post_feed_item_blur_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElevatedButtonWithWidgetLeft extends StatelessWidget {
  final String text;
  final Widget widget;
  final Function()? onPressed;
  const ElevatedButtonWithWidgetLeft(
      {required this.text,
      required this.widget,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.onSurface),
        foregroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.surface),
      ),
      onPressed: () => onPressed?.call(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: widget,
          ),
          Text(text),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  Widget _contentCardHeader(BuildContext context, Post post) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              post.title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w600),
              maxLines: 2,
              minFontSize: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _postThumbnail(BuildContext context, Post post) {
    const imgBorderRadius = Radius.circular(20);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: imgBorderRadius,
        bottomRight: imgBorderRadius,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(FullscreenVideoPage.route(
            url: VideoRepositoryImpl().createPlaybackUrl(
                (post.media.firstWhere((e) => e.type == asset_type.video)
                    as VideoAsset)))),
        child: Stack(children: [
          Hero(
            tag: PostFeedItemBlur.heroTag,
            child: NetworkPlaceholderImage(
              VideoRepositoryImpl()
                  .createThumbnailUrl(post.media[0] as VideoAsset),
              Container(
                color: Colors.grey,
              ),
              width: MediaQuery.of(context).size.width.toInt(),
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Icon(
              Icons.play_arrow_rounded,
              size: 70,
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) => state.when(
        loading: (_) => Container(),
        normal: (post, isJoining) => SliverAppBar(
          //backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 60 + AppTheme.PADDING_SIDE + 12,
          leadingWidth: 48 + AppTheme.PADDING_SIDE * 2,
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 12.0 + AppTheme.PADDING_SIDE,
                top: 12.0 + AppTheme.PADDING_SIDE,
                bottom: 12),
            child: postAppBarButton(
                context: context,
                icon: Icons.arrow_back_ios_rounded,
                onPressed: () => Navigator.of(context).pop()),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 12.0 + AppTheme.PADDING_SIDE,
                top: 12.0 + AppTheme.PADDING_SIDE,
                bottom: 12,
              ),
              child: postAppBarButton(
                context: context,
                icon: Icons.settings,
                onPressed: () => showFloatingModalBottomSheet(
                  context: context,
                  builder: (ctx) => PostSettingsModalContent(
                    post: post,
                  ),
                ),
              ),
            )
          ],
          pinned: true,
          floating: false,
          stretch: true,
          centerTitle: true,
          title: VisibilityController(
            child: AutoSizeText(
              post.title,
              maxLines: 2,
            ),
          ),
          expandedHeight: MediaQuery.of(context).size.width.toDouble() + 80,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
            ],
            collapseMode: CollapseMode.parallax,
            background: Stack(
              children: [
                Padding(
                    //color: Theme.of(context).colorScheme.background,
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: _postThumbnail(context, post)),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: _contentCardHeader(context, post)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
