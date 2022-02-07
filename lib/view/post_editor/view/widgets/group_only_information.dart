import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/post_editor/models/general_editor_fields.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/meta_info_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

/// Information which is only valid for Groups
class GroupOnlyInformation extends StatelessWidget {
  final GroupEditorFields groupEditorFields;
  const GroupOnlyInformation(this.groupEditorFields, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
