import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/view/post/view/widgets/icon_text_item.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/extensions/date_time.dart';

class EventDetailSection extends StatelessWidget {
  final Event event;
  const EventDetailSection(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTextItem(
            icon: Icons.calendar_today_rounded,
            label: event.startTime.dateString,
            subLabel: "ab ${event.startTime.timeString} Uhr"),
        IconTextItem(
            icon: Icons.location_on_outlined,
            label: event.location,
            subLabel: "ToDo"),
      ],
    );
  }
}
