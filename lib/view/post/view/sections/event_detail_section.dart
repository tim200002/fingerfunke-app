import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/extensions/date_time.dart';
import 'package:fingerfunke_app/view/post/view/widgets/icon_text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/exceptions.dart';
import '../../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';

/// Shows structured information about the event
/// In [editing] mode, the values of these fields can be changed
class EventDetailSection extends StatelessWidget {
  final bool editing;
  const EventDetailSection(this.editing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                normal: (post, isJoining) => post is! Event
                    ? const Text("Die App unterstützt zur Zeit nur Events!")
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconTextItem(
                              icon: Icons.calendar_today_rounded,
                              label: post.startTime.dateString,
                              subLabel: "ab ${post.startTime.timeString} Uhr"),
                          IconTextItem(
                              icon: Icons.location_on_outlined,
                              label: post.location,
                              subLabel: "ToDo"),
                        ],
                      )));
  }
}

class _Edit extends StatelessWidget {
  const _Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          editEvent: (eventEditorFields, _) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTextItem(
                      icon: Icons.calendar_today_rounded,
                      label: eventEditorFields.startTime.dateString,
                      subLabel:
                          "ab ${eventEditorFields.startTime.timeString} Uhr",
                      onTap: () => showDatePicker(
                            context: context,
                            initialDate: eventEditorFields.startTime,
                            firstDate: DateTime(2021),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          ).then(
                            (pickedDate) {
                              if (pickedDate != null) {
                                showTimePicker(
                                        context: context,
                                        initialTime: eventEditorFields
                                            .startTime.timeOfDay)
                                    .then((time) {
                                  if (time != null) {
                                    context
                                        .read<PostEditorCubit>()
                                        .updateInformation(
                                            eventEditorFields.copyWith(
                                                startTime: eventEditorFields
                                                    .startTime
                                                    .copyTime(time)
                                                    .copyDate(pickedDate)));
                                  }
                                });
                              }
                            },
                          )),
                  IconTextItem(
                      icon: Icons.location_on_outlined,
                      label: "Location", //eventEditorFields.location,
                      subLabel: "",
                      onTap: () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('ToDo'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text(
                                          'Bisher ist das Setzen einer Location nicht möglich'),
                                    ],
                                  ),
                                ),
                                /*actions: <Widget>[
                              TextButton(
                                child: const Text('Ulm wählen'),
                                onPressed: () {
                                  context
                                        .read<PostEditorCubit>()
                                        .updateInformation(
                                            eventEditorFields.copyWith();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],*/
                              ))),
                ],
              ),
          orElse: () => throw InvalidStateException()),
    );
  }
}
