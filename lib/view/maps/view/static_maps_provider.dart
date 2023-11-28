import '../../../utils/skeleton_view.dart';
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
          var uri = GoogleMapsService.getGoogleUri(address);

          if (!(await canLaunchUrl(uri)) && address == "") {
            Tools.showSnackbar( l10n(context).msg_mapCouldNotOpen);
            return;
          }
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        },
        //TODO: change to cached network image
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: address != ""
              ? Image.network(
                  GoogleMapsService.getGoogleStaticApiUri(address).toString(),
                  height: height,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, process) => process == null
                      ? child
                      : SkeletonView.shimmer(const SkeletonView(
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
