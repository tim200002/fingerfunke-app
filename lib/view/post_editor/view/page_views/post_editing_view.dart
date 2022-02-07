import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/models/general_editor_fields.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/basic_text_field.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/event_only_information.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/event_or_group_selection_button.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/group_only_information.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/title_field.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/video_upload_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostEditingView extends StatelessWidget {
  final GeneralEditorFields editorFields;
  final post_type postType;
  final bool inputValid;
  final bool isEditingExisitingPost;
  const PostEditingView({
    required this.editorFields,
    required this.postType,
    required this.inputValid,
    required this.isEditingExisitingPost,
    Key? key,
  }) : super(key: key);

  String get _appBarTitle {
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
        title: Text(_appBarTitle),
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
                  VideoUploadSection(editorFields.videoUploadCubits),
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
                              EventOrGroupSelectionButton(postType),
                            postType == post_type.event
                                ? EventOnlyInformation(
                                    editorFields as EventEditorFields)
                                : GroupOnlyInformation(
                                    editorFields as GroupEditorFields)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            TitleField(editorFields.titleController),
            //const SizedBox(height: 10),
            BasicTextField(
                controller: editorFields.descriptionController,
                hintText: "Beschreibe deinen Post")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: inputValid
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[400],
        child: const Icon(Icons.send_rounded),
        onPressed:
            inputValid ? () => context.read<PostEditorCubit>().submit() : null,
      ),
    );
  }
}
