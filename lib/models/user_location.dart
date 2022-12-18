import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../utils/type_aliases.dart';
import 'abstract_models/abstract_models.dart';

class UserLocation extends Serializable {
  Position position;
  String address;

  UserLocation({required this.position, required this.address});

  factory UserLocation.fromJson(JsonMap map) => UserLocation(
        position: Position.fromMap(map["position"]),
        address: map["address"],
      );

  @override
  JsonMap toJson() => {"position": position.toJson(), "address": address};

  GeoPoint toGeoPoint() => GeoPoint(position.latitude, position.longitude);

  String? getCityName() =>
      address.split(",")[address.contains('+') ? 0 : 1].trim().split(" ").last;
}
