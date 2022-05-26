import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticMapsProvider extends StatefulWidget {
  final LatLng location;
  final String address;

  const StaticMapsProvider({
    Key? key,
    this.location = const LatLng(37.42796133580664, -122.085749655962),
    this.address = "",
  }) : super(key: key);

  @override
  State<StaticMapsProvider> createState() => _StaticMapsProviderState();
}

class _StaticMapsProviderState extends State<StaticMapsProvider> {
  late String googleUrl;
  late String searchQuery;
  late Uri renderURL;

  @override
  void initState() {
    super.initState();

    if (widget.address == "") {
      searchQuery = '${widget.location.latitude},${widget.location.longitude}';
    } else {
      searchQuery = widget.address;
    }

    renderURL = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        port: 443,
        path: '/maps/api/staticmap',
        queryParameters: {
          'size': '${600}x${600}',
          'center': searchQuery,
          'zoom': '15',
          'maptype': 'roadmap',
          'key': '${FlutterConfig.get('GOOGLE_MAPS_API_KEY_ANDROID')}'
        });
    print(renderURL);

    googleUrl = 'https://www.google.com/maps/search/?api=1&query=$searchQuery';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(googleUrl)) {
            await launch(googleUrl);
          } else {
            throw 'Could not open the map.';
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(renderURL.toString()),
              ),
              Center(
                child: CustomPaint(
                  painter: DrawCircle(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  final BuildContext context;
  const DrawCircle(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Theme.of(context).colorScheme.primary;
    canvas.drawCircle(Offset(0.0, -20.0), 7, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)
  {//false : paint call might be optimized away.
    return false;
  }
}
