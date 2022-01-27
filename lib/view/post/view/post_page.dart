import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/services/pagination/message_pagination_service.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/util_widgets/loading_page.dart';
import 'package:fingerfunke_app/view/chat/view/chat_page.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_app_bar_button.dart';
import 'package:fingerfunke_app/view/post/view/widgets/visibility_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  Widget _iconTextItem({required BuildContext context,
    required IconData icon,
    required String label,
    String? subLabel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(
            icon,
            size: 28,
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                )),
            subLabel != null
                ? Text(
              subLabel,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.5)),
            )
                : Container(),
          ],
        )
      ],
    );
  }

  Widget _heading({required BuildContext context, required String name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        name,
        style: Theme
            .of(context)
            .textTheme
            .headline5!
            .copyWith(
            color: Theme
                .of(context)
                .colorScheme
                .onSurface,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _contentCardHeader(BuildContext context, PostState state) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .surface,
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
        normal: (post) =>
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    post.title,
                    style: Theme
                        .of(context)
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
                                  Theme
                                      .of(context)
                                      .colorScheme
                                      .onSurface),
                              foregroundColor: MaterialStateProperty.all(
                                  Theme
                                      .of(context)
                                      .colorScheme
                                      .surface),
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

  Widget _dateTimeSection(BuildContext context, PostState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // TODO replace with actual post data
        Expanded(
            child: _iconTextItem(
                context: context,
                icon: Icons.calendar_today_rounded,
                label: state.maybeWhen(
                    normal: (post) => "23.21.2021", orElse: () => "No data"),
                subLabel: state.maybeWhen(
                    normal: (post) => "ab 18 Uhr", orElse: () => "No data"))),
        Expanded(
            child: _iconTextItem(
                context: context,
                icon: Icons.location_on_outlined,
                label: state.maybeWhen(
                    normal: (post) => "Sudetenstraße", orElse: () => "No data"),
                subLabel: state.maybeWhen(
                    normal: (post) => "89233 Neu-Ulm",
                    orElse: () => "No data")))
      ],
    );
  }

  Widget _descriptionSection(BuildContext context, PostState state) {
    return state.maybeWhen(
        normal: (post) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                post.description,
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle2,
              ),
            ),
        orElse: () => ErrorWidget(InvalidStateException()));
  }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (_) => PostCubit(postId),
        ),
        // it makes sense to already provide the chat message cubit here
        // so that when opening the chat initial messages are typically already loaded
        // therefore we require the cubit to be instantly built -> lazy is set to false
        BlocProvider(
          create: (_) =>
              PaginatedListCubit<Message>(
                  paginationService: MessagePaginationService(postId)),
          lazy: false,
        )
      ],
      child: Builder(
        builder: (context) =>
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) =>
                    state.when(
                      loading: (_) => const LoadingPage(),
                      normal: (post) =>
                          Scaffold(
                            backgroundColor: Theme
                                .of(context)
                                .colorScheme
                                .surface,
                            body: SafeArea(
                              child: CustomScrollView(
                                slivers: <Widget>[
                                  SliverAppBar(
                                    backgroundColor: Theme
                                        .of(context)
                                        .colorScheme
                                        .background,
                                    toolbarHeight: 60 +
                                        AppTheme.PADDING_SIDE * 3,
                                    leadingWidth: 48 +
                                        AppTheme.PADDING_SIDE * 2,
                                    leading: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12.0 + AppTheme.PADDING_SIDE,
                                        top: 12.0 + AppTheme.PADDING_SIDE,
                                        bottom: 12.0 + AppTheme.PADDING_SIDE,
                                      ),
                                      child: postAppBarButton(
                                          context: context,
                                          icon: Icons.arrow_back_ios_rounded,
                                          onPressed: () =>
                                              Navigator.of(context).pop()),
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 12.0 + AppTheme.PADDING_SIDE,
                                          top: 12.0 + AppTheme.PADDING_SIDE,
                                          bottom: 12.0 +
                                              AppTheme.PADDING_SIDE,),
                                        child: postAppBarButton(
                                            context: context,
                                            icon: Icons.settings,
                                            onPressed: () => {}),
                                      )
                                    ],
                                    pinned: true,
                                    floating: false,
                                    stretch: true,
                                    centerTitle: true,
                                    title: VisibilityController(
                                        child: AutoSizeText(state.maybeWhen(
                                            orElse: () => "",
                                            normal: (page) => page.title),
                                            maxLines: 2,

                                        )),
                                    expandedHeight:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width
                                        .toDouble() + 80,
                                    flexibleSpace: Padding(
                                      padding: const EdgeInsets.all(
                                          AppTheme.PADDING_SIDE),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            30.0),
                                        child: FlexibleSpaceBar(
                                          stretchModes: const [
                                            StretchMode.zoomBackground,
                                          ],
                                          collapseMode: CollapseMode.parallax,
                                          background: Stack(
                                            children: [
                                              Container(
                                                color: Theme
                                                    .of(context)
                                                    .colorScheme
                                                    .background,
                                                padding:
                                                const EdgeInsets.only(
                                                    bottom: 140.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(30.0),
                                                  child: NetworkPlaceholderImage(
                                                    VideoRepositoryImpl()
                                                        .createThumbnailUrl(
                                                        post
                                                            .media[0] as VideoAsset),
                                                    Container(
                                                      color: Colors.grey,
                                                    ),
                                                    fit: BoxFit.fitWidth,
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width
                                                        .toInt(),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                  alignment: Alignment
                                                      .bottomCenter,
                                                  child:
                                                  _contentCardHeader(
                                                      context, state)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    bottom: PreferredSize(
                                        preferredSize: const Size(0, 20),
                                        child: Transform.translate(
                                          offset: const Offset(0, 0),
                                          child: Container(
                                            clipBehavior: Clip.none,
                                            color: Theme
                                                .of(context)
                                                .colorScheme
                                                .surface,
                                            child: Container(
                                              width: double.infinity,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Theme
                                                    .of(context)
                                                    .colorScheme
                                                    .background,
                                                borderRadius: const BorderRadius
                                                    .only(
                                                    bottomLeft: Radius.circular(
                                                        20.0),
                                                    bottomRight: Radius.circular(
                                                        20.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: AppTheme
                                                  .PADDING_SIDE + 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              _heading(context: context,
                                                  name: 'Details'),
                                              _dateTimeSection(context, state),
                                              _heading(
                                                  context: context,
                                                  name: 'Beschreibung'),
                                              _descriptionSection(
                                                  context, state),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 24.0),
                                                child: Center(
                                                  child: state.maybeWhen(
                                                      orElse: () => Container(),
                                                      normal: (postState) =>
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .all(12.0),
                                                            child: Text(
                                                              "Erstellt von ${postState
                                                                  .author
                                                                  .name}",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .caption,
                                                            ),
                                                          )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SliverFillRemaining(),
                                ],
                              ),
                            ),
                            floatingActionButton: FloatingActionButton(
                              child: const Icon(
                                  Icons.chat_bubble_outline_rounded),
                              onPressed: () =>
                                  Navigator.of(context).pushNamed(chatRoute,
                                      arguments: ChatArguments(
                                          postId: postId,
                                          paginatedListCubit:
                                          BlocProvider.of<
                                              PaginatedListCubit<Message>>(
                                              context))),
                            ),
                          ),
                    ),
              ),
            ),
      ),
    );
  }
}
