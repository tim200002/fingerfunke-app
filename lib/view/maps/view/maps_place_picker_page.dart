import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../../env.dart' as env;
import '../../../utils/tools.dart';

class MapsPlacePickerPage extends StatelessWidget {
  final Function(PickResult) onPlacePicked;
  const MapsPlacePickerPage({required this.onPlacePicked, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: env.GOOGLE_MAPS_API_KEY,
      hintText: l10n(context).lbl_mapPlaceFind,
      searchingText: l10n(context).lbl_wait,
      selectText: l10n(context).lbl_mapPlaceSelect,
      outsideOfPickAreaText: l10n(context).lbl_mapPlaceNotInArea,
      initialPosition: const LatLng(37.42796133580664, -122.085749655962),
      useCurrentLocation: true,
      selectInitialPosition: true,
      usePinPointingSearch: true,
      usePlaceDetailSearch: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      onPlacePicked: (PickResult result) {
        onPlacePicked(result);
        Navigator.of(context).pop();
      },
    );
  }
}
