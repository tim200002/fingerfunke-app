import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/services/pagination/message_pagination_service.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/util_widgets/loading_page.dart';
import 'package:fingerfunke_app/view/chat/view/chat_page.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:fingerfunke_app/view/post/view/widgets/header_section.dart';
import 'package:fingerfunke_app/view/post/view/widgets/author_section.dart';
import 'package:fingerfunke_app/view/post/view/widgets/event_detail_section.dart';
import 'package:fingerfunke_app/view/post/view/widgets/post_description_section.dart';
import 'package:fingerfunke_app/view/post/view/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

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
              normal: (post, _) => Scaffold(
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: SafeArea(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      const HeaderSection(),
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
                                  const SectionHeading('Infos'),
                                  post is Event
                                      ? EventDetailSection(post)
                                      : Container(),
                                  const SectionHeading('Details'),
                                  PostDescriptionSection(post),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  AuthorSection(post.author)
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
                  onPressed: () => Navigator.of(context).pushNamed(
                    chatRoute,
                    arguments: ChatArguments(
                      chatName: post.title,
                      postId: postId,
                      paginatedListCubit:
                          BlocProvider.of<PaginatedListCubit<Message>>(context),
                    ),
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
