import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Selection Button to switch between creating event and group
/// Only visisble when we are not editing a given post (event cannot be turned into group and vice versa)
class EventOrGroupSelectionButton extends StatelessWidget {
  final post_type postType;
  const EventOrGroupSelectionButton(this.postType, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
