import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/app_cubit/app_cubit.dart';
import '../../../../models/post/post.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/tools.dart';
import '../../../chat/cubit/chat_cubit_cubit.dart';
import '../../../error/exception_view.dart';
import '../../cubits/abstract_post_editor_cubit/abstract_post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../shared_widgets/post_posted_success_view.dart';
import '../../shared_widgets/post_posting_view.dart';
import '../cubit/event_editor_cubit.dart';
import 'sections/author_section.dart';
import 'sections/event_detail_section.dart';
import 'sections/header_section.dart';
import 'sections/location_section.dart';
import 'sections/post_action_buttons.dart';
import 'sections/post_description_section.dart';
import 'sections/title_section.dart';

class EventPage extends StatelessWidget {
  static const String editingHeroTag = "postEditor";
  final bool editing;

  const EventPage({Key? key, this.editing = false}) : super(key: key);

  Widget _content(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: CustomScrollView(
          slivers: [
            HeaderSection(editing, includeTitle: true),
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
                        TitleSection(editing),
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
        create: (_) => PostCubit(
          postId,
          userId: context.read<AppCubit>().state.user.id,
        ),
      ),

      // it makes sense to already provide the chat message cubit here
      // so that when opening the chat initial messages are typically already loaded
      // therefore we require the cubit to be instantly built -> lazy is set to false
      BlocProvider(
        create: (_) => ChatCubit(postId),
        lazy: false,
      )
    ], child: builder(context));
  }

  Widget _editProviders(BuildContext context, Function(BuildContext) builder) {
    final Event? event = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as Event
        : null;

    final user = BlocProvider.of<AppCubit>(context).state.user;
    return BlocProvider<EventEditorCubit>(
      create: (context) {
        if (event == null) {
          return EventEditorCubit.createEmpty(user);
        } else {
          return EventEditorCubit.fromEvent(user, event);
        }
      },
      child: BlocBuilder<EventEditorCubit, PostEditorState>(
          builder: (context, state) => state.when(
              editing: (_, __) => builder(context),
              error: ExceptionView.builder,
              submitted: (id) => PostPostedSuccessView(postId: id),
              submitting: () => const PostPostingView())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? _editProviders(context, (c) => _content(c))
        : _viewProviders(context, (c) => _content(c));
  }
}
