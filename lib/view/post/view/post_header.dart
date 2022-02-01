import 'package:auto_size_text/auto_size_text.dart';
import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/util_widgets/floating_modal.dart';
import 'package:fingerfunke_app/view/image_upload/view/image_upload_modal_content.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_app_bar_button.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_settings_modal_content.dart';
import 'package:fingerfunke_app/view/post/view/widgets/visibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({Key? key}) : super(key: key);

  Widget _contentCardHeader(BuildContext context, PostState state) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
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
      child: state.maybeWhen(
        orElse: () => ErrorWidget(InvalidStateException()),
        normal: (post) => Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.onSurface),
                          foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.surface),
                        ),
                        onPressed: () {
                          print("clicked");
                        },
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.add),
                            ),
                            Text("Ich komme"),
                          ],
                        )),
                    Center(
                      child: IconButton(
                        onPressed: () => {},
                        //TODO change to filled icon when date is bookmarked
                        icon: const Icon(Icons.bookmark_border_rounded),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) => state.when(
        loading: (_) => Container(),
        normal: (post) => SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 60 + AppTheme.PADDING_SIDE ,
          leadingWidth: 48 + AppTheme.PADDING_SIDE * 2,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 12.0 + AppTheme.PADDING_SIDE,
              top: 12.0 + AppTheme.PADDING_SIDE,
            ),
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
              ),
              child: postAppBarButton(
                  context: context, icon: Icons.settings, onPressed: () => showFloatingModalBottomSheet(context: context, builder: (ctx) => PostSettingsModalContent(externalContext: context))),
            )
          ],
          pinned: true,
          floating: false,
          stretch: true,
          centerTitle: true,
          title: VisibilityController(
              child: AutoSizeText(
            state.maybeWhen(orElse: () => "", normal: (page) => page.title),
            maxLines: 2,
          )),
          expandedHeight: MediaQuery.of(context).size.width.toDouble() + 80,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(AppTheme.PADDING_SIDE),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      padding: const EdgeInsets.only(bottom: 140.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: NetworkPlaceholderImage(
                          VideoRepositoryImpl()
                              .createThumbnailUrl(post.media[0] as VideoAsset),
                          Container(
                            color: Colors.grey,
                          ),
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width.toInt(),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: _contentCardHeader(context, state)),
                  ],
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(0, 20),
            child: Transform.translate(
              offset: const Offset(0, 10),
              child: Container(
                clipBehavior: Clip.none,
                color: Theme.of(context).colorScheme.surface,
                child: Container(
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
