import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/models/general_editor_fields.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/event_only_information.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/event_or_group_selection_button.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/group_only_information.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/text_field_section.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/video_upload_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditingView extends StatelessWidget {
  final GeneralEditorFields editorFields;
  final bool isEditingExisitingPost;
  const PostEditingView({
    required this.editorFields,
    required this.isEditingExisitingPost,
    Key? key,
  }) : super(key: key);

  String _appBarTitle(post_type postType) {
    switch (postType) {
      case post_type.event:
        {
          if (isEditingExisitingPost) {
            return "Event bearbeiten";
          } else {
            return "Neues Event";
          }
        }
      case post_type.recurrent:
        {
          if (isEditingExisitingPost) {
            return "Gruppe bearbeiten";
          } else {
            return "Neue Gruppe";
          }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<PostEditorCubit, PostEditorState>(
            builder: (context, state) => state.maybeWhen(
                editEvent: (_, __) => Text(_appBarTitle(post_type.event)),
                editGroup: (_, __) => Text(_appBarTitle(post_type.recurrent)),
                orElse: () => throw InvalidStateException()),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VideoUploadSection(),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!isEditingExisitingPost)
                                const EventOrGroupSelectionButton(),
                              BlocBuilder<PostEditorCubit, PostEditorState>(
                                buildWhen: (prev, curr) =>
                                    prev.runtimeType != curr.runtimeType,
                                builder: (context, state) => state.maybeWhen(
                                    editEvent: (_, __) =>
                                        const EventOnlyInformation(),
                                    editGroup: (_, __) =>
                                        const GroupOnlyInformation(),
                                    orElse: () =>
                                        throw InvalidStateException()),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const TextFieldSection()
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<PostEditorCubit, PostEditorState>(
          builder: (context, state) {
            bool inputValid = state.maybeWhen(
                editEvent: (_, isValid) => isValid,
                editGroup: (_, isValid) => isValid,
                orElse: () => throw InvalidStateException());
            return FloatingActionButton(
              backgroundColor: inputValid
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[400],
              child: const Icon(Icons.send_rounded),
              onPressed: inputValid
                  ? () => context.read<PostEditorCubit>().submit()
                  : null,
            );
          },
        ));
  }
}
