import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../utils/app_config.dart';
import '../utils/type_aliases.dart';
import '../utils/utility_classes/geohash.dart';
import 'abstract_models/abstract_models.dart';

class UserLocation extends Serializable {
  final GeoHasher _geoHasher = GeoHasher();
  Position position;
  String address;

  UserLocation({required this.position, required this.address});

  factory UserLocation.fromJson(JsonMap map) => UserLocation(
        position: Position.fromMap(map["position"]),
        address: map["address"],
      );
  
  String get geohash => _geoHasher.encode(position.longitude, position.latitude, precision: AppConfig.defaultGeoHashPrecision);
  
  @override
  JsonMap toJson() => {"position": position.toJson(), "address": address};

  GeoPoint toGeoPoint() => GeoPoint(position.latitude, position.longitude);
}
