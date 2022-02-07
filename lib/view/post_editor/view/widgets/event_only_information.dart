import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/models/general_editor_fields.dart';
import 'package:fingerfunke_app/view/post_editor/view/widgets/meta_info_button.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/extensions/date_time.dart';
import 'package:fingerfunke_app/utils/extensions/date_time.dart';
import 'package:provider/src/provider.dart';

/// Section with information which are only valid for an event
class EventOnlyInformation extends StatelessWidget {
  final EventEditorFields eventEditorFields;
  const EventOnlyInformation(this.eventEditorFields, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MetaInfoButton(
          text: eventEditorFields.startTime.dateString,
          icon: Icons.calendar_today_rounded,
          onPressed: () => showDatePicker(
            context: context,
            initialDate: eventEditorFields.startTime,
            firstDate: DateTime(2021),
            lastDate: DateTime.now().add(
              const Duration(days: 365),
            ),
          ) //what will be the up to supported date in picker
              .then(
            (pickedDate) {
              if (pickedDate != null) {
                context.read<PostEditorCubit>().updateInformation(
                    eventEditorFields.copyWith(
                        startTime:
                            eventEditorFields.startTime.copyDate(pickedDate)));
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MetaInfoButton(
          text: eventEditorFields.startTime.timeString,
          icon: Icons.schedule,
          onPressed: () => showTimePicker(
                  context: context,
                  initialTime: eventEditorFields.startTime.timeOfDay)
              .then(
            (time) {
              if (time != null) {
                context.read<PostEditorCubit>().updateInformation(
                    eventEditorFields.copyWith(
                        startTime: eventEditorFields.startTime.copyTime(time)));
              }
            },
          ),
        )
      ],
    );
  }
}
