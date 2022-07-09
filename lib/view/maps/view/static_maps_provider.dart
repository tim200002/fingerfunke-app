import '../../../utils/placeholder_box.dart';
import '../../../utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/google_maps_service.dart';

class StaticMapsProvider extends StatelessWidget {
  static const double height = 200;
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
          if (await canLaunchUrl(GoogleMapsService.getGoogleUri(address)) &&
              address != "") {
            await launchUrl(GoogleMapsService.getGoogleUri(address));
          } else {
            Tools.showSnackbar(context, 'Could not open the map.');
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: address != ""
              ? Image.network(
                  GoogleMapsService.getGoogleStaticApiUri(address).toString(),
                  height: height,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, __, ___) =>
                      PlaceholderBox.shimmer(const PlaceholderBox(
                    height: height,
                  )),
                  errorBuilder: ((_, __, ___) => Container(
                        height: height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: const Center(
                            child: Icon(
                          Icons.location_off,
                          color: Colors.grey,
                        )),
                      )),
                )
              : Container(color: Colors.black12),
        ),
      ),
    );
  }
}
