import 'package:fingerfunke_app/common_widgets/helper_widgets.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/video_recorder/view/video_recorder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PEInfoSection extends StatelessWidget {
  const PEInfoSection({Key? key}) : super(key: key);

  Widget _eventGroupButton(BuildContext context,
      {required void Function() onPressed,
      required IconData icon,
      required String text,
      required bool selected}) {
    final Color color = selected ? Colors.black : Colors.grey;
    return InkWell(
        onTap: onPressed,
        child: Column(children: [
          Icon(
            icon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(text,
                style: TextStyle(
                    color: color,
                    fontWeight:
                        selected ? FontWeight.bold : FontWeight.normal)),
          )
        ]));
  }

  Widget _metaInfoButton(BuildContext context,
      {required void Function() onPressed,
      required IconData icon,
      required String text}) {
    return InkWell(
        onTap: onPressed,
        child: Row(children: [
          Icon(icon),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade50),
                  child: Text(text,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                )),
          )
        ]));
  }

  Widget _mediaSection(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(context, VideoRecorderPage.route()),
        child: HelperWidgets.materialHero(
          tag: VideoRecorderPage.video_hero_tag,
          child: Container(
            width: 125,
            height: 210,
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text("TODO:\nPostVideo"),
            ),
          ),
        ));
  }

  Widget _eventInfo(BuildContext context) {
    return Column(
      children: [
        _metaInfoButton(context,
            text: "19.12.2021",
            icon: Icons.calendar_today_rounded,
            onPressed: () => DevTools.showToDoSnackbar(context)),
        const SizedBox(
          height: 20,
        ),
        _metaInfoButton(context,
            text: "18:00",
            icon: Icons.schedule,
            onPressed: () => DevTools.showToDoSnackbar(context))
      ],
    );
  }

  Widget _groupInfo(BuildContext context) {
    return Column(
      children: [
        _metaInfoButton(context,
            text: "19.12.2021 TEXT",
            icon: Icons.calendar_today_rounded,
            onPressed: () => DevTools.showToDoSnackbar(context)),
        const SizedBox(
          height: 20,
        ),
        _metaInfoButton(context,
            text: "18:00 TEXT",
            icon: Icons.schedule,
            onPressed: () => DevTools.showToDoSnackbar(context))
      ],
    );
  }

  Widget _eventGroupInfo(
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 35),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _eventGroupButton(context,
                  text: "Event",
                  icon: Icons.mood_rounded,
                  selected: true,
                  onPressed: () => DevTools.showToDoSnackbar(context)),
              _eventGroupButton(context,
                  text: "Gruppe",
                  icon: Icons.people_rounded,
                  selected: false,
                  onPressed: () => DevTools.showToDoSnackbar(context)),
            ],
          ),
        ),
        _eventInfo(context)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _mediaSection(context),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _eventGroupInfo(context),
            ),
          ))
        ],
      ),
    );
  }
}
