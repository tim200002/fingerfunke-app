import 'dart:io';

import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/floating_modal.dart';
import 'package:fingerfunke_app/view/fullscreen_video/view/fullscreen_video_page.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_settings_modal_content.dart';
import 'package:fingerfunke_app/view/post_feed/view/post_feed_item_blur_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/helper_widgets.dart';
import '../../../../common_widgets/upload/video_upload_tile.dart';
import '../../../../cubits/video_upload_cubit/video_upload_cubit.dart';
import '../../../../utils/exceptions.dart';
import '../../../video_recorder/view/video_recorder_page.dart';
import '../../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../editor_models/general_editor_fields.dart';

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

class PostAppBarButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const PostAppBarButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
              onPressed: onPressed,
              icon: Icon(icon))),
    );
  }
}

class HeaderSection extends StatelessWidget {
  static const double titleHeight = 80 + 20;
  static const titleMaxCharacters = 160;
  static const imgBorderRadius = Radius.circular(20);

  final bool editing;
  final double thumbnailHeight;
  final double titleOverlap;

  const HeaderSection(this.editing,
      {Key? key, this.thumbnailHeight = 350, this.titleOverlap = 30})
      : super(key: key);

  static Widget _titleCardHeader(
      BuildContext context, double thumbnailHeight, double titleOverlap,
      {required String title, void Function(String)? onChanged}) {
    return Container(
      margin: EdgeInsets.only(
          left: 15, right: 15, bottom: 20, top: thumbnailHeight - titleOverlap),
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            onChanged == null
                ? Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w600, height: 1.3),
                    maxLines: 2,
                  )
                : TextFormField(
                    initialValue: title,
                    style: Theme.of(context).textTheme.headline5,
                    minLines: 1,
                    maxLines: 3,
                    maxLength: titleMaxCharacters,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintText: "Titel des Posts",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.grey)),
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
                  right: 12.0 + AppTheme.PADDING_SIDE,
                  top: 12.0 + AppTheme.PADDING_SIDE,
                  bottom: 12,
                ),
                child: PostAppBarButton(
                  icon: Icons.settings,
                  onPressed: () => showFloatingModalBottomSheet(
                    context: context,
                    builder: (_) => const PostSettingsModalContent(),
                  ),
                ),
              )
            ],
      pinned: true,
      floating: false,
      stretch: true,
      centerTitle: true,
      /*title: VisibilityController(
                  child: AutoSizeText(
                    post.title,
                    maxLines: 2,
                  ),
                ),*/
      expandedHeight: thumbnailHeight + titleHeight - titleOverlap,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        collapseMode: editing ? CollapseMode.pin : CollapseMode.parallax,
        background: editing
            ? _Edit(thumbnailHeight, titleOverlap)
            : BlocBuilder<PostCubit, PostState>(
                builder: (context, state) => state.when(
                  loading: (_) => const CircularProgressIndicator.adaptive(),
                  normal: (post, isJoining) => Stack(
                    children: [
                      SizedBox(
                          height: thumbnailHeight,
                          child: _postThumbnail(context, post)),
                      _titleCardHeader(context, thumbnailHeight, titleOverlap,
                          title: post.title),
                    ],
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
  const _Edit(this.thumbnailHeight, this.titleOverlap, {Key? key})
      : super(key: key);

  Widget _thumbnail(
    BuildContext context,
    List<VideoUploadCubit> uploadCubits,
  ) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: HeaderSection.imgBorderRadius,
          bottomRight: HeaderSection.imgBorderRadius,
        ),
        child: InkWell(
          onTap: () async {
            File? video =
                await Navigator.push<File?>(context, VideoRecorderPage.route());
            if (video != null) {
              context.read<PostEditorCubit>().addVideo(video);
            }
          },
          child: HelperWidgets.materialHero(
            tag: VideoRecorderPage.videoHeroTag,
            child: (uploadCubits.isNotEmpty)
                ? VideoUploadTile(
                    cubit: uploadCubits[0],
                    onDelete: (cubitId) =>
                        context.read<PostEditorCubit>().removeVideo(cubitId),
                    height: 210,
                  )
                : Container(
                    height: 210,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryVariant,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        const Center(child: Icon(Icons.add_a_photo_outlined)),
                  ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          editEvent: (fields, _) => Stack(
                children: [
                  SizedBox(
                      height: thumbnailHeight,
                      child: _thumbnail(context, fields.videoUploadCubits)),
                  HeaderSection._titleCardHeader(
                    context,
                    thumbnailHeight,
                    titleOverlap,
                    title: fields.title,
                    onChanged: (t) => BlocProvider.of<PostEditorCubit>(context)
                        .updateInformation(GeneralEditorFields.copyWithHelper(
                            fields,
                            title: t)),
                  ),
                ],
              ),
          orElse: () => throw InvalidStateException()),
    );
  }
}
