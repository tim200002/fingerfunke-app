import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsLocationWidget extends StatefulWidget {
  final LatLng location;
  const MapsLocationWidget({Key? key,
    this.location = const LatLng(37.42796133580664, -122.085749655962)
  }) : super(key: key);

  @override
  State<MapsLocationWidget> createState() => _MapsLocationWidgetState();
}

class _MapsLocationWidgetState extends State<MapsLocationWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  late CameraPosition camPos;

  @override
  void initState() {
    super.initState();
    camPos = CameraPosition(
      target: widget.location,
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: camPos,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}
