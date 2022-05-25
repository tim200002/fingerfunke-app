import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsLocationWidget extends StatefulWidget {
  final LatLng location;

  const MapsLocationWidget({Key? key,
    this.location = const LatLng(37.42796133580664, -122.085749655962)})
      : super(key: key);

  @override
  State<MapsLocationWidget> createState() => _MapsLocationWidgetState();
}

class _MapsLocationWidgetState extends State<MapsLocationWidget> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late CameraPosition camPos;
  late String googleUrl;

  @override
  void initState() {
    super.initState();

    final Marker marker =
    Marker(markerId: const MarkerId("0"), position: widget.location);
    markers[marker.markerId] = marker;

    camPos = CameraPosition(
      target: widget.location,
      zoom: 14.4746,
    );
    googleUrl =
    'https://www.google.com/maps/search/?api=1&query=${widget.location
        .latitude},${widget.location.longitude}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: GoogleMap(
    onTap: (latLang) async {
      if (await canLaunch(googleUrl)) {
        await launch(googleUrl);
      } else {
        throw 'Could not open the map.';
      }
    },
    mapType: MapType.normal,
    initialCameraPosition: camPos,
    myLocationEnabled: true,
    myLocationButtonEnabled: false,
    zoomControlsEnabled: false,
    markers: Set<Marker>.of(markers.values),
    ),
    ),
    ),
    );
    }
  }
