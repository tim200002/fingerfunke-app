import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/placeholder_box.dart';
import '../../../../../utils/tools.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../cubit/event_editor_cubit.dart';
import 'post_description_section.dart';

class TitleSection extends StatelessWidget {
  final bool editing;
  const TitleSection(this.editing, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTheme.textStyleCondensed(
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black));

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: editing
          ? _Edit(titleStyle: titleStyle)
          : BlocBuilder<PostCubit, PostState>(
              builder: (context, state) => state.when(
                loading: (_) =>
                    PlaceholderBox.shimmer(PostDescriptionSection.loading()),
                normal: (post, _) => Text(
                  post.title,
                  overflow: TextOverflow.ellipsis,
                  style: post.asEvent?.isCompleted ?? false
                      ? titleStyle.copyWith(color: Colors.grey.shade600)
                      : titleStyle,
                  maxLines: 2,
                ),
              ),
            ),
    );
  }
}

class _Edit extends StatelessWidget {
  final TextStyle titleStyle;
  const _Edit({Key? key, required this.titleStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventEditorCubit eventEditorCubit = context.read<EventEditorCubit>();
    return TextFormField(
      initialValue: eventEditorCubit.title,
      style: titleStyle,
      maxLength: 160,
      onChanged: (value) =>
          BlocProvider.of<EventEditorCubit>(context).updateTitle(value),
      decoration: InputDecoration(
          isCollapsed: true,
          counterText: "",
          border: InputBorder.none,
          hintText: l10n(context).lbl_postEditTitle,
          hintStyle: titleStyle.copyWith(color: Colors.grey)),
    );
  }
}
