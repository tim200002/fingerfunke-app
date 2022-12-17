import '../../../../utils/placeholder_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/exceptions.dart';
import '../../../../utils/tools.dart';
import '../../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../editor_models/general_editor_fields.dart';

/// This section is used to display the describtion text of the post.
/// In [editing] mode, the text is editable
class PostDescriptionSection extends StatelessWidget {
  final bool editing;
  const PostDescriptionSection(this.editing, {Key? key}) : super(key: key);

  static Widget loading() {
    return Column(children: [
      for (int i = 2; i >= 0; i--)
        PlaceholderBox.text(width: i == 0 ? 100 : null)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                  loading: (_) => PlaceholderBox.shimmer(loading()),
                  normal: (post, _) => Text(
                    post.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ));
  }
}

class _Edit extends StatelessWidget {
  const _Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralEditorFields fields = BlocProvider.of<PostEditorCubit>(context)
        .state
        .maybeWhen(
            editEvent: (fields, _) => fields,
            editGroup: (fields, _) => fields,
            orElse: () => throw InvalidStateException());
    return BlocListener<PostEditorCubit, PostEditorState>(
      listener: (context, state) => state.maybeWhen(
          editEvent: (updatedFields, _) => fields = updatedFields,
          editGroup: (updatedFields, _) => fields = updatedFields,
          orElse: () => throw InvalidStateException()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title field
          TextFormField(
            initialValue: fields.description,
            maxLines: null,
            onChanged: (value) => BlocProvider.of<PostEditorCubit>(context)
                .updateInformation(GeneralEditorFields.copyWithHelper(fields,
                    description: value)),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: l10n(context).lbl_postDescription,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
              height: 60) // so the field does not overlap with the FAB
        ],
      ),
    );
  }
}
