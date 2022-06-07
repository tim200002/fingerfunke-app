import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/services/pagination/message_pagination_service.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/error/exception_view.dart';
import 'package:fingerfunke_app/view/maps/view/static_maps_provider.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/view/sections/author_section.dart';
import 'package:fingerfunke_app/view/post/view/sections/header_section.dart';
import 'package:fingerfunke_app/view/post/view/sections/post_action_buttons.dart';
import 'package:fingerfunke_app/view/post/view/sections/post_description_section.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/edit_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/authentication_cubit/authentication_cubit.dart';
import '../../../models/post/post.dart';
import '../../post_editor/view/page_views/post_posted_success_view.dart';
import '../../post_editor/view/post_editor_page.dart';
import '../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../cubits/post_viewer_cubit/post_cubit.dart';
import 'sections/event_detail_section.dart';
import 'sections/location_section.dart';

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
                        LocationSection(editing),
                        const SizedBox(height: 24),
                        AuthorSection(editing),
                        const SizedBox(height: 96),
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
    final PostEditorArguments? arguments =
        ModalRoute.of(context)!.settings.arguments != null
            ? ModalRoute.of(context)!.settings.arguments as PostEditorArguments
            : null;
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () =>
            DevTools.placeholder("user is not signed in. push to login"),
        signedIn: (user) => BlocProvider<PostEditorCubit>(
          create: (context) => PostEditorCubit(
              currentUser: user, postToBeEdited: arguments?.post),
          child: BlocConsumer<PostEditorCubit, PostEditorState>(
            buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
            listener: (context, state) =>
                state.whenOrNull(error: (e) => Tools.showSnackbar(context, e)),
            builder: (context, state) => state.when(
              loading: () => const EditLoadingView(message: "loading"),
              editEvent: (_, __) => builder(context),
              editGroup: (fields, inputValid) => ExceptionView(
                  exception: Exception("editing groups is not yet possible")),
              error: (message) => const EditErrorView(),
              submitted: () => const PostPostedSuccessView(),
              submitting: () => const EditLoadingView(message: "submitting"),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? _editProviders(context, (c) => _content(c))
        : _viewProviders(context, (c) => _content(c));
  }
}
