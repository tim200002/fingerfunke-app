import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/post/post.dart';
import '../../../../services/google_maps_service.dart';
import '../../../../utils/exceptions.dart';
import '../../../../utils/extensions/date_time.dart';
import '../../../../utils/placeholder_box.dart';
import '../../../../utils/tools.dart';
import '../../../maps/view/maps_place_picker_page.dart';
import '../../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';
import '../widgets/icon_text_item.dart';

/// Shows structured information about the event
/// In [editing] mode, the values of these fields can be changed
class EventDetailSection extends StatelessWidget {
  final bool editing;

  const EventDetailSection(this.editing, {Key? key}) : super(key: key);

  Widget _loading() {
    // including this would clutter the loading UI. Therefore i left it out
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => PlaceholderBox.shimmer(_loading()),
                normal: (post, isJoining) => post is! Event
                    ? Text(l10n(context).msg_postOnlyEventsSupported)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconTextItem(
                              icon: FeatherIcons.calendar,
                              label: post.startTime.dateString,
                              subLabel: l10n(context)
                                  .lbl_postTime(post.startTime.timeString)),
                          IconTextItem(
                            icon: FeatherIcons.mapPin,
                            label: post.location.split(',')[0],
                            subLabel: post.location.split(',').length < 2
                                ? null
                                : post.location.split(',')[1],
                            onTap: () async {
                              if (await canLaunchUrl(
                                  GoogleMapsService.getGoogleUri(
                                      post.location))) {
                                await launchUrl(GoogleMapsService.getGoogleUri(
                                    post.location));
                              } else {
                                throw 'Could not open the map.';
                              }
                            },
                          ),
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
                      subLabel: l10n(context)
                          .lbl_postTime(eventEditorFields.startTime.timeString),
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
                    label: eventEditorFields.location == ""
                        ? l10n(context).lbl_locationChoose
                        : eventEditorFields.location.split(',')[0],
                    subLabel: eventEditorFields.location == ""
                        ? null
                        : eventEditorFields.location.split(',').length < 2
                            ? null
                            : eventEditorFields.location.split(',')[1],
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context2) =>
                              BlocProvider<PostEditorCubit>.value(
                            value: BlocProvider.of<PostEditorCubit>(context),
                            child: MapsPlacePickerPage(
                              onPlacePicked: (pickResult) => context
                                  .read<PostEditorCubit>()
                                  .updateInformation(eventEditorFields.copyWith(
                                      location: pickResult.formattedAddress)),
                            ),
                          ),
                        )),
                  )
                ],
              ),
          orElse: () => throw InvalidStateException()),
    );
  }
}
