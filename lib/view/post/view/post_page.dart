import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/services/pagination/message_pagination_service.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/util_widgets/loading_page.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:fingerfunke_app/view/post/view/widgets/author_section.dart';
import 'package:fingerfunke_app/view/post/view/widgets/header_section.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_action_buttons.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_description_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/event_detail_section.dart';

class PostPage extends StatelessWidget {
  final bool editing;
  const PostPage({Key? key, this.editing = false}) : super(key: key);

  Widget _content(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: CustomScrollView(
          slivers: <Widget>[
            HeaderSection(editing),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: AppTheme.PADDING_SIDE + 8,
                      right: AppTheme.PADDING_SIDE + 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventDetailSection(editing),
                        const SizedBox(height: 15),
                        PostDescriptionSection(editing),
                        const SizedBox(height: 24),
                        AuthorSection(editing)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppTheme.PADDING_SIDE),
            child: PostActionButtons(editing)));
  }

  Widget _viewProviders(BuildContext context, Function(BuildContext) builder) {
    final postId = ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(providers: [
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
    ], child: builder(context));
  }

  Widget _editProviders(BuildContext context, Function(BuildContext) builder) {
    return Container(
      child: builder(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? _editProviders(context, (c) => _content(c))
        : _viewProviders(context, (c) => _content(c));
  }
}
