import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Selection Button to switch between creating event and group
/// Only visisble when we are not editing a given post (event cannot be turned into group and vice versa)
class EventOrGroupSelectionButton extends StatelessWidget {
  const EventOrGroupSelectionButton({Key? key}) : super(key: key);

  Widget _content(BuildContext context, post_type postType) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SelectableButton(
              text: "Event",
              icon: Icons.mood_rounded,
              selected: postType == post_type.event,
              onPressed: () =>
                  context.read<PostEditorCubit>().switchEditorMode()),
          SelectableButton(
              text: "Gruppe",
              icon: Icons.people_rounded,
              selected: postType == post_type.recurrent,
              onPressed: () =>
                  context.read<PostEditorCubit>().switchEditorMode()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          editEvent: (_, __) => _content(context, post_type.event),
          editGroup: (_, __) => _content(context, post_type.recurrent),
          orElse: () => throw InvalidStateException()),
    );
  }
}
