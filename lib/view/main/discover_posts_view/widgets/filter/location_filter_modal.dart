import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../models/place.dart';
import '../../../../../services/device_location_service.dart';
import '../../../../../utils/tools.dart';
import '../../../../../utils/util_widgets/floating_modal.dart';
import '../../../../maps/view/maps_place_picker_page.dart';
import 'cubit/feed_filter_cubit.dart';

class LocationFilterModal extends StatelessWidget {
  const LocationFilterModal._({super.key});

  static Future<void> openAsModalBottomSheet(BuildContext context, {Key? key}) {
    return showFloatingModalBottomSheet<void>(
        context: context,
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider.value(
                value: BlocProvider.of<FeedFilterCubit>(context),
              ),
              BlocProvider.value(
                  value: BlocProvider.of<LocationCubit>(context)),
            ], child: LocationFilterModal._(key: key)));
  }

  void _onSensorPick(BuildContext context) {
    Navigator.of(context).pop();
    context
        .read<FeedFilterCubit>()
        .update((v) => v.copyWith(useSetLocation: false));
    context.read<LocationCubit>().refresh();
  }

  Future<void> _setMapPickResult(BuildContext c, PickResult p) async {
    var location = p.geometry!.location;
    Place place = await LocationService.placeFromCoordinate(
        Coordinate(location.lat, location.lng));
    c
        .read<FeedFilterCubit>()
        .update((v) => v.copyWith(setLocation: place, useSetLocation: true));
  }

  void _onMapPick(BuildContext context) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: BlocProvider.of<FeedFilterCubit>(context),
              child: MapsPlacePickerPage(onPlacePicked: (c, p) async {
                await _setMapPickResult(c, p);
              }))));

  Widget _button(BuildContext context,
      {required IconData icon,
      required String label,
      required Function(BuildContext) onPressed}) {
    return TextButton.icon(
        onPressed: () => onPressed(context),
        icon: Icon(icon),
        label: Expanded(
            child: Text(
          label,
          textAlign: TextAlign.left,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _button(context,
            icon: FeatherIcons.mapPin,
            label: l10n(context).lbl_filterLocationCurrent,
            onPressed: _onSensorPick),
        _button(context,
            icon: FeatherIcons.map,
            label: l10n(context).lbl_filterLocationFromMap,
            onPressed: _onMapPick)
      ],
    );
  }
}
