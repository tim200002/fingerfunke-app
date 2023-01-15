import '../../../../../utils/skeleton_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/tools.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../cubit/event_editor_cubit.dart';

/// This section is used to display the describtion text of the post.
/// In [editing] mode, the text is editable
class PostDescriptionSection extends StatelessWidget {
  final bool editing;
  const PostDescriptionSection(this.editing, {Key? key}) : super(key: key);

  static Widget loading() {
    return Column(children: [
      for (int i = 2; i >= 0; i--) SkeletonView.text(width: i == 0 ? 100 : null)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                  loading: (_) => SkeletonView.shimmer(loading()),
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
    EventEditorCubit eventEditorCubit = context.read<EventEditorCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // title field
        TextFormField(
          initialValue: eventEditorCubit.description,
          maxLines: null,
          onChanged: (value) => eventEditorCubit.updateDescription(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: l10n(context).lbl_postDescription,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 60) // so the field does not overlap with the FAB
      ],
    );
  }
}
