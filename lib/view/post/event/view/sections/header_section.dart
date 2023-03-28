import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import '../../../../../common_widgets/list_items/in_past_filter.dart';
import '../../../../../common_widgets/upload/video_upload_tile.dart';
import '../../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../../cubits/video_upload_cubit/video_upload_cubit.dart';
import '../../../../../models/asset/asset.dart';
import '../../../../../models/post/post.dart';
import '../../../../../repositories/video_repository/video_repository.dart';
import '../../../../../repositories/video_repository/video_repository.impl.dart';
import '../../../../../utils/app_theme.dart';
import '../../../../../utils/skeleton_view.dart';
import '../../../../../utils/tools.dart';
import '../../../../fullscreen_video/view/fullscreen_video_page.dart';
import '../../../../video_recorder/view/video_recorder_page.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../../shared_widgets/post_settings_modal_content.dart';
import '../../cubit/event_editor_cubit.dart';

/// Widget to display a button with additional [widget] on the left. This widget
/// can for example be used to display an Icon or loading indicator
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

/// Button that has a solid background to make it easier to see when overlaid
/// over video content
class PostAppBarButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final Function() onPressed;
  const PostAppBarButton(
      {Key? key,
      required this.icon,
      this.enabled = true,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 6), // changes position of shadow
                  ),
                ],
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                onPressed: enabled ? onPressed : null,
                icon: Icon(
                  icon,
                  size: 30,
                ))),
      ),
    );
  }
}

/// Section that displays the video and title of the given post
/// In [editing] mode, the video and title are editable
class HeaderSection extends StatelessWidget {
  static const double titleHeight = 120 + 20;
  static const titleMaxCharacters = 160;
  static const imgBorderRadius = Radius.circular(20);

  final bool editing;
  final double thumbnailHeight;
  final bool includeTitle;
  final double titleOverlap;

  const HeaderSection(this.editing,
      {Key? key,
      this.includeTitle = false,
      this.thumbnailHeight = 350,
      double titleOverlap = 40})
      : titleOverlap = includeTitle ? titleOverlap : 0,
        super(key: key);

  static Widget _titleCardHeader(
      BuildContext context, double thumbnailHeight, double titleOverlap,
      {required String title,
      void Function(String)? onChanged,
      final bool disabled = false}) {
    final TextStyle titleStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontWeight: FontWeight.w600, height: 1.3);
    return Container(
      margin: EdgeInsets.only(
          left: 15, right: 15, top: thumbnailHeight - titleOverlap),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: onChanged == null
                  ? Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: disabled
                          ? titleStyle.copyWith(color: Colors.grey.shade600)
                          : titleStyle,
                      maxLines: 2,
                    )
                  : TextFormField(
                      initialValue: title,
                      style: titleStyle,
                      minLines: 1,
                      maxLines: 2,
                      maxLength: titleMaxCharacters,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          counterText: "",
                          border: InputBorder.none,
                          hintText: l10n(context).lbl_postEditTitle,
                          hintStyle: titleStyle.copyWith(color: Colors.grey)),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _postThumbnail(BuildContext context, Post post) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: imgBorderRadius,
        bottomRight: imgBorderRadius,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(FullscreenVideoPage.route(
            url: VideoRepositoryImpl().createPlaybackUrl((post.media
                .firstWhere((e) => e.type == AssetType.video) as VideoAsset)))),
        child: Stack(children: [
          InPastFilter(
              isInPast: post.asEvent?.isCompleted ?? false,
              child: NetworkPlaceholderImage(
                VideoRepositoryImpl()
                    .createThumbnailUrl(post.media[0] as VideoAsset),
                Container(
                  color: Colors.grey,
                ),
                width: MediaQuery.of(context).size.width.toInt(),
                fit: BoxFit.cover,
              )),
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

  Widget _loading() {
    return Stack(children: [
      SkeletonView(height: thumbnailHeight),
      SkeletonView.background(
        height: 80,
        borderRadius: 20,
        margin: EdgeInsets.only(
            left: 15, right: 15, top: thumbnailHeight - titleOverlap),
        child: const SkeletonView.headline(
          width: 100,
          alignment: Alignment.center,
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //backgroundColor: Theme.of(context).colorScheme.background,
      toolbarHeight: 60 + AppTheme.PADDING_SIDE + 12,
      leadingWidth: 48 + AppTheme.PADDING_SIDE * 2,
      leading: Padding(
        padding: const EdgeInsets.only(
            left: 12.0 + AppTheme.PADDING_SIDE,
            top: 12.0 + AppTheme.PADDING_SIDE,
            bottom: 12),
        child: PostAppBarButton(
            icon: editing ? Icons.close_rounded : Icons.arrow_back_ios_rounded,
            onPressed: () => Navigator.of(context).pop()),
      ),
      actions: editing
          ? []
          : [
              Padding(
                  padding: const EdgeInsets.only(
                    right: AppTheme.PADDING_SIDE,
                    top: 12.0 + AppTheme.PADDING_SIDE,
                    bottom: 12,
                  ),
                  child: BlocBuilder<AppCubit, AppState>(
                      builder: (context, appState) =>
                          BlocBuilder<PostCubit, PostState>(
                            builder: (context, postState) {
                              Post? post;
                              final postId =
                                  context.read<PostCubit>().state.when(
                                        normal: (p, _) {
                                          post = p;
                                          return p.id;
                                        },
                                        loading: (postId) => postId,
                                      );
                              final hasPostSaved =
                                  appState.user.savedPosts.contains(postId);
                              return PostAppBarButton(
                                  enabled: (post?.author.id ?? "") !=
                                      appState.user.id,
                                  icon: hasPostSaved
                                      ? Icons.bookmark_rounded
                                      : Icons.bookmark_border_rounded,
                                  onPressed: () => context
                                      .read<PostCubit>()
                                      .toggleSaved(
                                          appState.user.id, hasPostSaved));
                            },
                          ))),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12.0 + AppTheme.PADDING_SIDE,
                  top: 12.0 + AppTheme.PADDING_SIDE,
                  bottom: 12,
                ),
                child: PostAppBarButton(
                    icon: FeatherIcons.moreVertical,
                    onPressed: () =>
                        PostSettingsModalContent.openAsModalBottomSheet(
                            context)),
              ),
            ],
      pinned: true,
      floating: false,
      stretch: true,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30))),
      expandedHeight: thumbnailHeight +
          (includeTitle ? 0 : (titleHeight - titleOverlap - 40)),
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.zoomBackground,
          ],
          collapseMode: editing ? CollapseMode.pin : CollapseMode.parallax,
          background: editing
              ? _Edit(thumbnailHeight, titleOverlap, includeTitle)
              : BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) => state.when(
                    loading: (_) => SkeletonView.shimmer(_loading()),
                    normal: (post, _) => Stack(
                      children: [
                        SizedBox(
                            height: thumbnailHeight,
                            child: _postThumbnail(context, post)),
                        if (!includeTitle)
                          _titleCardHeader(
                              context, thumbnailHeight, titleOverlap,
                              title: post.title,
                              disabled: post.asEvent?.isCompleted ?? false),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _Edit extends StatelessWidget {
  final double thumbnailHeight;
  final double titleOverlap;
  final bool includeTitle;
  const _Edit(this.thumbnailHeight, this.titleOverlap, this.includeTitle,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventEditorCubit eventEditorCubit =
        BlocProvider.of<EventEditorCubit>(context);
    return Stack(
      children: [
        SizedBox(
            height: thumbnailHeight,
            child: _Thumbnail(eventEditorCubit.videoUploadCubits.isNotEmpty
                ? eventEditorCubit.videoUploadCubits[0]
                : null)),
        if (!includeTitle)
          HeaderSection._titleCardHeader(
            context,
            thumbnailHeight,
            titleOverlap,
            title: eventEditorCubit.title,
            onChanged: (title) =>
                BlocProvider.of<EventEditorCubit>(context).updateTitle(title),
          ),
      ],
    );
  }
}

class _Thumbnail extends StatefulWidget {
  final VideoUploadCubit? initialUploadCubit;
  const _Thumbnail(this.initialUploadCubit);

  @override
  State<_Thumbnail> createState() => __ThumbnailState();
}

class __ThumbnailState extends State<_Thumbnail> {
  final VideoRepository _videoRep = VideoRepositoryImpl();
  late VideoUploadCubit? uploadCubit;
  @override
  void initState() {
    uploadCubit = widget.initialUploadCubit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: HeaderSection.imgBorderRadius,
      ),
      child: InkWell(
        onTap: uploadCubit != null
            ? () {
                if (uploadCubit?.hasUploaded ?? false) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FullscreenVideoPage(
                          url: _videoRep
                              .createPlaybackUrl(uploadCubit!.asset))));
                }
              }
            : () async {
                File? video = await Navigator.push<File?>(
                    context, VideoRecorderPage.route());
                if (video != null) {
                  EventEditorCubit eventEditorCubit =
                      context.read<EventEditorCubit>();

                  VideoUploadCubit videoUploadCubit = VideoUploadCubit.fromFile(
                      video,
                      onVideoUploaded: () => eventEditorCubit.validateInput());
                  setState(() {
                    uploadCubit = videoUploadCubit;
                  });
                  context
                      .read<EventEditorCubit>()
                      .addVideoUploadCubit(videoUploadCubit);
                }
              },
        child: (uploadCubit != null)
            ? VideoUploadTile(
                cubit: uploadCubit!,
                onDelete: (cubitId) {
                  context
                      .read<EventEditorCubit>()
                      .removeVideoUploadCubit(cubitId);
                  setState(() {
                    uploadCubit = null;
                  });
                },
                height: 210,
              )
            : Container(
                height: 210,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.6),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                child: Center(
                  child: Icon(
                    FeatherIcons.video,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 40,
                  ),
                ),
              ),
      ),
    );
  }
}
