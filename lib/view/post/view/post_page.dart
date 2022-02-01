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
import 'package:fingerfunke_app/view/post/view/post_header.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_app_bar_button.dart';
import 'package:fingerfunke_app/view/post/view/widgets/visibility_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  Widget _iconTextItem(
      {required BuildContext context,
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
            color: Theme.of(context).colorScheme.primary,
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
                        color: Theme.of(context)
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
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold),
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
        normal: (post) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                post.description,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
        orElse: () => ErrorWidget(InvalidStateException()));
  }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (_) => PostCubit(postId),
        ),
        // it makes sense to already provide the chat message cubit here
        // so that when opening the chat initial messages are typically already loaded
        // therefore we require the cubit to be instantly built -> lazy is set to false
        BlocProvider(
          create: (_) => PaginatedListCubit<Message>(
              paginationService: MessagePaginationService(postId)),
          lazy: false,
        )
      ],
      child: Builder(
        builder: (context) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
              loading: (_) => const LoadingPage(),
              normal: (post) => Scaffold(
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: SafeArea(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      const PostHeader(),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: AppTheme.PADDING_SIDE + 8,
                                right: AppTheme.PADDING_SIDE + 8,
                                top: AppTheme.PADDING_SIDE,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _heading(context: context, name: 'Details'),
                                  _dateTimeSection(context, state),
                                  _heading(
                                      context: context, name: 'Beschreibung'),
                                  _descriptionSection(context, state),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: Center(
                                      child: state.maybeWhen(
                                          orElse: () => Container(),
                                          normal: (postState) => Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Erstellt von ${postState.author.name}",
                                                  style: Theme.of(context)
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
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.chat_bubble_outline_rounded),
                  onPressed: () => Navigator.of(context).pushNamed(chatRoute,
                      arguments: ChatArguments(
                          postId: postId,
                          paginatedListCubit:
                              BlocProvider.of<PaginatedListCubit<Message>>(
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
