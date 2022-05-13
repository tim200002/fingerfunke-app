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

import '../../../cubits/authentication_cubit/authentication_cubit.dart';
import '../../../routes.dart';
import '../../../utils/tools.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  Widget _joinButton(BuildContext context, Post post, bool isJoining) {
    bool isParticipant = BlocProvider.of<AuthenticationCubit>(context)
        .state
        .maybeWhen(
            signedIn: (currentUser) => post.isUserParticipant(currentUser),
            orElse: () => false);
    bool isLoggedIn = BlocProvider.of<AuthenticationCubit>(context)
        .state
        .maybeWhen(signedIn: (_) => true, orElse: () => false);
    return ElevatedButton.icon(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 55)),
          elevation: MaterialStateProperty.all(10),
          foregroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.onPrimary),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
      label: Text(isParticipant ? "Ich bin dabei" : "Ich komme"),
      icon: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: !isJoining
            ? Icon(isParticipant ? Icons.check : Icons.add)
            : const SizedBox.square(
                dimension: 24,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                )),
      ),
      onPressed: !isLoggedIn || isParticipant
          ? null
          : () => BlocProvider.of<PostCubit>(context).joinPost().catchError(
                (_) => Tools.showSnackbar(context, "Oops something went wrong"),
              ),
    );
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
              normal: (post, isJoining) => Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  body: CustomScrollView(
                    slivers: <Widget>[
                      const HeaderSection(),
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
                                  post is Event
                                      ? EventDetailSection(post)
                                      : Container(),
                                  const SizedBox(height: 15),
                                  PostDescriptionSection(post),
                                  const SizedBox(height: 24),
                                  AuthorSection(post.author)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.PADDING_SIDE),
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: _joinButton(context, post, isJoining)),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              child:
                                  const Icon(Icons.chat_bubble_outline_rounded),
                              onPressed: () => Navigator.of(context).pushNamed(
                                    chatRoute,
                                    arguments: ChatArguments(
                                      chatName: post.title,
                                      postId: postId,
                                      paginatedListCubit: BlocProvider.of<
                                          PaginatedListCubit<Message>>(context),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
