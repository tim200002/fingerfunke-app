import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/meta_info_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Information which is only valid for Groups
class GroupOnlyInformation extends StatelessWidget {
  const GroupOnlyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          editGroup: (groupEditorFields, _) => Column(
                children: [
                  MetaInfoButton(
                      text: "Zeitpunkt",
                      icon: Icons.calendar_today_rounded,
                      onPressed: () =>
                          Tools.showSnackbar(context, "ToDo implement Group")),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
          orElse: () => throw InvalidStateException()),
    );
  }
}
