import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/google_maps_service.dart';

class StaticMapsProvider extends StatelessWidget {
  final LatLng latLong;
  final String address;

  const StaticMapsProvider({
    Key? key,
    this.latLong = const LatLng(37.42796133580664, -122.085749655962),
    this.address = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(GoogleMapsService.getGoogleUri(address))) {
            await launchUrl(GoogleMapsService.getGoogleUri(address));
          } else {
            throw 'Could not open the map.';
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(GoogleMapsService.getGoogleStaticApiUri(address).toString()),
          ),
        ),
      ),
    );
  }
}
