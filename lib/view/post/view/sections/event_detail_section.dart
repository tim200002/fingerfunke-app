import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/post/view/widgets/icon_text_item.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/extensions/date_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/post_viewing_cubit/post_cubit.dart';

class EventDetailSection extends StatelessWidget {
  final bool editing;
  const EventDetailSection(this.editing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return editing
        ? DevTools.placeholder("PostInfos")
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => const CircularProgressIndicator.adaptive(),
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
