import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../models/place.dart';
import '../../../../../models/post/post.dart';
import '../../../../../services/google_maps_service.dart';
import '../../../../../utils/extensions/date_time.dart';
import '../../../../../utils/skeleton_view.dart';
import '../../../../../utils/tools.dart';
import '../../../../maps/view/maps_place_picker_page.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../../shared_widgets/icon_text_item.dart';
import '../../cubit/event_editor_cubit.dart';

/// Shows structured information about the event
/// In [editing] mode, the values of these fields can be changed
class EventDetailSection extends StatelessWidget {
  final bool editing;

  const EventDetailSection(this.editing, {Key? key}) : super(key: key);

  Widget _loading() {
    // including this would clutter the loading UI. Therefore I left it out
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
              loading: (_) => SkeletonView.shimmer(_loading()),
              normal: (post, _) => post is! Event
                  ? Text(l10n(context).msg_postOnlyEventsSupported)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (post.isCompleted)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(FeatherIcons.info),
                                    const SizedBox(width: 15),
                                    Expanded(
                                        child: Text(
                                            l10n(context).lbl_eventInPastEdit))
                                  ]),
                            ),
                          ),
                        IconTextItem(
                            icon: FeatherIcons.calendar,
                            label: post.startTime.dateString,
                            subLabel: l10n(context)
                                .lbl_postTime(post.startTime.timeString)),
                        IconTextItem(
                          icon: FeatherIcons.mapPin,
                          label: post.place.address.split(',')[0],
                          subLabel: post.place.address.split(',').length < 2
                              ? null
                              : post.place.address.split(',')[1],
                          onTap: () async {
                            if (await canLaunchUrl(
                                GoogleMapsService.getGoogleUri(
                                    post.place.address))) {
                              await launchUrl(
                                  GoogleMapsService.getGoogleUri(
                                      post.place.address),
                                  mode: LaunchMode.externalApplication);
                            } else {
                              throw 'Could not open the map.';
                            }
                          },
                        ),
                      ],
                    ),
            ),
          );
  }
}

class _Edit extends StatelessWidget {
  const _Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventEditorCubit eventEditorCubit =
        BlocProvider.of<EventEditorCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _DatePicker(eventEditorCubit.startTime),
        _AdressPicker(eventEditorCubit.place)
      ],
    );
  }
}

class _DatePicker extends StatefulWidget {
  final DateTime initialDate;
  const _DatePicker(this.initialDate);

  @override
  State<_DatePicker> createState() => __DatePickerState();
}

class __DatePickerState extends State<_DatePicker> {
  late DateTime date;

  @override
  void initState() {
    date = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconTextItem(
      icon: Icons.calendar_today_rounded,
      label: date.dateString,
      subLabel: l10n(context).lbl_postTime(date.timeString),
      onTap: () {
        FocusScope.of(context).unfocus();
        showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
        ).then(
          (pickedDate) {
            if (pickedDate != null) {
              showTimePicker(
                      context: context, initialTime: DateTime.now().timeOfDay)
                  .then((time) {
                if (time != null) {
                  DateTime newDate = DateTime(pickedDate.year, pickedDate.month,
                      pickedDate.day, time.hour, time.minute, 0, 0, 0);
                  setState(() {
                    date = newDate;
                  });
                  context.read<EventEditorCubit>().updateStartTime(newDate);
                }
              });
            }
          },
        );
      },
    );
  }
}

class _AdressPicker extends StatefulWidget {
  final Place? initialPlace;
  const _AdressPicker(this.initialPlace);

  @override
  State<_AdressPicker> createState() => __AdressPickerState();
}

class __AdressPickerState extends State<_AdressPicker> {
  Place? place;

  @override
  void initState() {
    place = widget.initialPlace;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconTextItem(
      icon: Icons.location_on_outlined,
      label: place != null
          ? place!.address.split(',')[0]
          : l10n(context).lbl_locationChoose,
      subLabel: place == null
          ? null
          : place!.address.split(',').length < 2
              ? null
              : place!.address.split(',')[1],
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapsPlacePickerPage(
              onPlacePicked: (pickResult) {
                _onPlacePicked(pickResult);
                Navigator.pop(context);
              },
              initialPosition: context.read<LocationCubit>().state.maybeWhen(
                  loaded: (location) => location.position, orElse: () => null),
            ),
          ),
        );
      },
    );
  }

  void _onPlacePicked(PickResult pickResult) {
    setState(() {
      place = Place.fromGoogleMapsPick(pickResult);
      context.read<EventEditorCubit>().updatePlace(place);
    });
  }
}
