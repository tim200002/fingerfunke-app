import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';

import '../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../utils/app_config.dart';
import '../../../../../../utils/tools.dart';
import '../../../../maps/view/maps_place_picker_page.dart';
import 'cubit/feed_filter_cubit.dart';
import 'cubit/feed_filter_state.dart';

class LocationFilterView extends StatelessWidget {
  const LocationFilterView({Key? key}) : super(key: key);

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
    final FeedFilterState initalFilterState =
        context.read<FeedFilterCubit>().state;
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
        child: ListView(
          children: [
            _sectionHeader(context, l10n(context).lbl_filterPerimeter),
            _LocationSlider(initalFilterState.radius, (v) {
              context.read<FeedFilterCubit>().updateRadius(v);
            }),
            _sectionHeader(context, l10n(context).lbl_filterPosts),
            _FilterItem(
                l10n(context).lbl_filterAll,
                l10n(context).lbl_filterHidePast,
                initalFilterState.hideCompleted,
                (v) => context.read<FeedFilterCubit>().updateHidecCompleted(v)),
            const SizedBox(height: 12),
            _FilterItem(
                l10n(context).lbl_filterAll,
                l10n(context).lbl_filterOnlyNearFuture,
                initalFilterState.hideFarFuture,
                (v) => context.read<FeedFilterCubit>().updateHideFartFuture(v)),
            //_filterItem("alle anzeigen", "alte verstecken")
          ],
        ),
      ),
    );
  }
}

class _LocationSlider extends StatefulWidget {
  final void Function(int) _onChanged;
  final int _initialRadius;
  final int _numberOfDivisions = AppConfig.locationQueryRadiusLevel.length - 1;

  _LocationSlider(this._initialRadius, this._onChanged, {super.key});

  @override
  State<_LocationSlider> createState() => _LocationSliderState();
}

/// Debounced Location Slider. The slider is debounced to not lead to too many
/// rebuilds since with every rebuild the whole list is loaded newly
class _LocationSliderState extends State<_LocationSlider> {
  late int radius;

  @override
  void initState() {
    radius = widget._initialRadius;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context2) => BlocProvider.value(
                  value: BlocProvider.of<LocationCubit>(context),
                  child: MapsPlacePickerPage(
                      onPlacePicked: (PickResult pickResult) => context
                          .read<LocationCubit>()
                          .updateLocation(
                              lat: pickResult.geometry!.location.lat,
                              lng: pickResult.geometry!.location.lng,
                              address: pickResult.formattedAddress)),
                ),
              ),
            ),
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
                    loaded: (location) => location.getCityName(),
                  )),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Slider(
            value: AppConfig.locationQueryRadiusLevel
                .indexOf(radius)
                .toDouble(), // math.max(minRadius, math.min(maxRadius, value ?? maxRadius)),
            max: (widget._numberOfDivisions).toDouble(),
            divisions: widget._numberOfDivisions,
            min: 0,
            label: "+ $radius km",
            onChanged: (v) {
              int rangeIndex = v.round();
              int radiusLevel = AppConfig.locationQueryRadiusLevel[rangeIndex];
              setState(() {
                radius = radiusLevel;
              });

              EasyDebounce.debounce(
                  'location-slider-debouncer', // <-- An ID for this particular debouncer
                  const Duration(milliseconds: 500),
                  () => widget._onChanged(radiusLevel));
              //onChanged(v < max ? v : null),
            },
          ),
        ],
      ),
    );
  }
}

class _FilterItem extends StatefulWidget {
  final String _off;
  final String _on;
  final Function(bool) _onChanged;
  final bool _initialState;
  final double _borderwidth = 1.5;
  const _FilterItem(this._off, this._on, this._initialState, this._onChanged,
      {super.key});

  @override
  State<_FilterItem> createState() => __FilterItemState();
}

class __FilterItemState extends State<_FilterItem> {
  late bool state;
  @override
  void initState() {
    state = widget._initialState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        borderColor: Colors.grey.shade100,
        selectedBorderColor: Colors.grey.shade100,
        constraints: BoxConstraints.expand(
            width: constraints.maxWidth / 2 - (widget._borderwidth * 3) / 2,
            height: 70),
        children: [
          Text(widget._off, textAlign: TextAlign.center),
          Text(widget._on, textAlign: TextAlign.center),
          //Icon(FeatherIcons.thumbsUp),
          //Icon(FeatherIcons.meh),
        ],
        onPressed: (int index) {
          setState(() {
            state = index == 1;
          });

          widget._onChanged(state);
        },
        isSelected: [!state, state],
      ),
    );
  }
}
