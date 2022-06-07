import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticMapsProvider extends StatelessWidget {
  final LatLng latLong;
  final String address;

  const StaticMapsProvider({
    Key? key,
    this.latLong = const LatLng(37.42796133580664, -122.085749655962),
    this.address = "",
  }) : super(key: key);

  Uri getGoogleUri() {
    String searchQuery;
    if (address == "") {
      searchQuery = '${latLong.latitude},${latLong.longitude}';
    } else {
      searchQuery = address;
    }
    return Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        port: 443,
        path: '/maps/api/staticmap',
        queryParameters: {
          'size': '${600}x${600}',
          'center': '',
          'markers': searchQuery,
          'zoom': '15',
          'maptype': 'roadmap',
          'key': '${FlutterConfig.get('GOOGLE_MAPS_API_KEY')}'
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(getGoogleUri())) {
            await launchUrl(getGoogleUri());
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
            child: Image.network(getGoogleUri().toString()),
          ),
        ),
      ),
    );
  }
}
