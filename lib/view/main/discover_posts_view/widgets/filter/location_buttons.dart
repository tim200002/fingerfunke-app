part of "location_filter_view.dart";

class _LocationButtons extends StatefulWidget {
  final void Function(int) _onChanged;
  final int _initialRadius;
  final int _numberOfDivisions = AppConfig.locationQueryRadiusLevel.length - 1;

  _LocationButtons(this._initialRadius, this._onChanged);

  @override
  State<_LocationButtons> createState() => _LocationButtonsState();
}

/// Debounced Location Slider. The slider is debounced to not lead to too many
/// rebuilds since with every rebuild the whole list is loaded newly
class _LocationButtonsState extends State<_LocationButtons> {
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
          TextButton(
            onPressed: () =>
                LocationFilterModal.openAsModalBottomSheet(context),
            child: BlocBuilder<FeedFilterCubit, FeedFilter>(
                builder: (_, filterState) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                            filterState.useSetLocation
                                ? FeatherIcons.map
                                : FeatherIcons.mapPin,
                            size: 17),
                        const SizedBox(width: 5),
                        filterState.useSetLocation
                            ? AutoSizeText(
                                filterState.setLocation.getCityName())
                            : BlocBuilder<LocationCubit, LocationState>(
                                builder: (context, state) =>
                                    AutoSizeText(state.when(
                                  loading: () =>
                                      l10n(context).lbl_locationLoading,
                                  denied: (_) =>
                                      l10n(context).lbl_locationUnknown,
                                  error: (_) =>
                                      l10n(context).lbl_locationUnknown,
                                  loaded: (location) => location.getCityName(),
                                )),
                              )
                      ],
                    )),
          ),
          const SizedBox(height: 10),
          Slider(
            value:
                AppConfig.locationQueryRadiusLevel.indexOf(radius).toDouble(),
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
