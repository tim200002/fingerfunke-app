import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../models/place.dart';
import '../../../../../repositories/geocoding_repository/geocodig_repository.dart';
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

  Future<Place> _getDeviceLocationFromGps() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final Place place = await GeoCodingRepository.placeFromCoordinate(
        Coordinate(position.latitude, position.longitude));
    return place;
  }

  Future<void> _onSensorPick(BuildContext context) async {
    final LocationCubit locationCubit = context.read<LocationCubit>();
    Navigator.of(context).pop();
    try {
      // Get current location
      final PermissionState permissionState =
          await PermissionState.loadPermissionState();

      // case 1 permission denied forever
      if (permissionState.locationPermission ==
          LocationPermission.deniedForever) {
        return Tools.showSnackbar(
            "Please allow location permission in settings");
      }

      // Case 2 position denied but one can ask
      if (permissionState.locationPermission == LocationPermission.denied ||
          permissionState.locationPermission ==
              LocationPermission.deniedForever) {
        if (!permissionState.locationServiceEnabled) {
          return Tools.showSnackbar("Please activate location services");
        }
        // If location services are enabled, then ask for permission
        final LocationPermission permission =
            await Geolocator.requestPermission();

        // permission denied again
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return Tools.showSnackbar(
              "You must accept location permission to access device location");
        }
        final Place place = await _getDeviceLocationFromGps();
        return locationCubit.setLocation(place);
      }

      // Case 3 permission granted
      final Place place = await _getDeviceLocationFromGps();
      return locationCubit.setLocation(place);
    } catch (e) {
      Tools.showSnackbar("Something went wrong");
    }
  }

  Future<void> _setMapPickResult(LocationCubit cubit, PickResult p) async {
    var location = p.geometry!.location;
    Place place = await GeoCodingRepository.placeFromCoordinate(
        Coordinate(location.lat, location.lng));
    cubit.setLocation(place);
  }

  void _onMapPick(BuildContext context) {
    final FeedFilterCubit filterCubit = context.read<FeedFilterCubit>();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: filterCubit,
          child: MapsPlacePickerPage(
            onPlacePicked: (p) async {
              _setMapPickResult(context.read<LocationCubit>(), p);
              Navigator.of(context).pop();
            },
            // if position of user is known, set it as initial position for the map
            // else use the default position
            initialPosition: context.read<LocationCubit>().state.maybeWhen(
                loaded: (location) => location.position, orElse: () => null),
          ),
        ),
      ),
    );
  }

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
        _button(
          context,
          icon: FeatherIcons.mapPin,
          label: l10n(context).lbl_filterLocationCurrent,
          onPressed: _onSensorPick,
        ),
        _button(context,
            icon: FeatherIcons.map,
            label: l10n(context).lbl_filterLocationFromMap,
            onPressed: _onMapPick)
      ],
    );
  }
}
