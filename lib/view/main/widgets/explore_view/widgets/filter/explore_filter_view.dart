import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../utils/tools.dart';
import '../../../../../maps/view/maps_place_picker_page.dart';
import 'cubit/feed_filter_cubit.dart';

class ExploreFilterView extends StatelessWidget {
  const ExploreFilterView({Key? key}) : super(key: key);

  Widget _filterItem(
      String off, String on, bool value, Function(bool) onChanged) {
    double borderwidth = 1.5;
    return LayoutBuilder(
      builder: (context, constraints) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        borderColor: Colors.grey.shade100,
        selectedBorderColor: Colors.grey.shade100,
        constraints: BoxConstraints.expand(
            width: constraints.maxWidth / 2 - (borderwidth * 3) / 2,
            height: 70),
        children: [
          Text(off, textAlign: TextAlign.center),
          Text(on, textAlign: TextAlign.center),
          //Icon(FeatherIcons.thumbsUp),
          //Icon(FeatherIcons.meh),
        ],
        onPressed: (int index) => onChanged(index == 1),
        isSelected: [!value, value],
      ),
    );
  }

  Widget _locationSlider(BuildContext context, double? value,
      {double max = 35, required Function(double?) onChanged}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context2) => BlocProvider.value(
                        value: BlocProvider.of<LocationCubit>(context),
                        child: MapsPlacePickerPage(
                            onPlacePicked: (PickResult pickResult) => context
                                .read<LocationCubit>()
                                .updateLocation(
                                    lat: pickResult.geometry!.location.lat,
                                    lng: pickResult.geometry!.location.lng,
                                    address: pickResult.formattedAddress)),
                      ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(FeatherIcons.mapPin, size: 17),
                  const SizedBox(width: 5),
                  BlocBuilder<LocationCubit, LocationState>(
                      builder: (context, state) => AutoSizeText(state.when(
                          loading: () => l10n(context).lbl_locationLoading,
                          denied: (_) => l10n(context).lbl_locationUnknown,
                          error: (_) => l10n(context).lbl_locationUnknown,
                          loaded: (location) => context
                              .read<LocationCubit>()
                              .generateAddress(location.address))))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Slider(
              value: math.max(5, math.min(max, value ?? max)),
              max: max,
              divisions: 6,
              min: 5,
              label: value != null ? "+ ${value.floor()} km" : "alle",
              onChanged: (v) => onChanged(v < max ? v : null),
            ),
          ],
        ));
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(l10n(context).lbl_exploreFilterEdit),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(FeatherIcons.check))
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<FeedFilterCubit, FeedFilterState>(
          builder: (context, filter) {
            return ListView(
              children: [
                _sectionHeader(context, l10n(context).lbl_filterPerimeter),
                _locationSlider(context, filter.distance, onChanged: (v) {
                  print(v);
                  context
                      .read<FeedFilterCubit>()
                      .change(filter.copyWith(distance: v));
                }),
                _sectionHeader(context, l10n(context).lbl_filterPosts),
                _filterItem(
                    l10n(context).lbl_filterAll,
                    l10n(context).lbl_filterHidePast,
                    filter.hideCompleted,
                    (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(hideCompleted: v))),
                const SizedBox(height: 12),
                _filterItem(
                    l10n(context).lbl_filterAll,
                    l10n(context).lbl_filterOnlyNearFuture,
                    filter.hideFarFuture,
                    (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(hideFarFuture: v))),
                //_filterItem("alle anzeigen", "alte verstecken")
              ],
            );
          },
        ),
      ),
    );
  }
}
