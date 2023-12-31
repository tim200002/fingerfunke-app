import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../../models/place.dart';
import '../../../utils/tools.dart';

class MapsPlacePickerPage extends StatelessWidget {
  final FutureOr Function(PickResult) onPlacePicked;
  static const LatLng _defaultInitialPosition = LatLng(49.583332, 11.016667);
  late final LatLng initialPosition;
  
  MapsPlacePickerPage({required this.onPlacePicked, Coordinate? initialPosition, Key? key})
      : super(key: key){
        if(initialPosition == null){
          this.initialPosition = _defaultInitialPosition;
        }
        else{
          this.initialPosition = LatLng(initialPosition.latitude, initialPosition.longitude);
        }
      }

  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: const String.fromEnvironment("GOOGLE_MAPS_API_KEY"),
      hintText: l10n(context).lbl_mapPlaceFind,
      searchingText: l10n(context).lbl_wait,
      selectText: l10n(context).lbl_mapPlaceSelect,
      outsideOfPickAreaText: l10n(context).lbl_mapPlaceNotInArea,
      initialPosition: initialPosition,
      useCurrentLocation: false,
      selectInitialPosition: true,
      usePinPointingSearch: true,
      usePlaceDetailSearch: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      onPlacePicked: (PickResult result) async {
        await onPlacePicked(result);
      },
    );
  }
}
