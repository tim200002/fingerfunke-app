import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../utils/app_config.dart';
import '../utils/type_aliases.dart';
import '../utils/utility_classes/geohash.dart';
import 'abstract_models/abstract_models.dart';


class Coordinate{

  const Coordinate(this.latitude, this.longitude)
      : assert(latitude >= -90 && latitude <= 90),
        assert(longitude >= -180 && longitude <= 180);

   final double latitude; // ignore: public_member_api_docs
  final double longitude; // ignore: public_member_api_docs

  factory Coordinate.fromJson(JsonMap map){
     if (!map.containsKey('latitude')) {
        throw ArgumentError.value(map, 'positionMap',
            'The supplied map doesn\'t contain the mandatory key `latitude`.');
      }

      if (!map.containsKey('longitude')) {
        throw ArgumentError.value(map, 'positionMap',
            'The supplied map doesn\'t contain the mandatory key `longitude`.');
      }
      final Coordinate coordinate = Coordinate(map['latitude'], map['longitude']);
      return coordinate;
    }

  JsonMap toJson() => {
    'longitude': longitude,
    'latitude': latitude,
  };

  @override
  bool operator ==(Object other) =>
      other is GeoPoint &&
      other.latitude == latitude &&
      other.longitude == longitude;

  @override
  int get hashCode => Object.hash(latitude, longitude);
}

class Place extends Serializable {
  final GeoHasher _geoHasher = GeoHasher();
  Coordinate position;
  String address;

  Place({required this.position, required this.address});

  factory Place.fromJson(JsonMap map) => Place(
        position: Coordinate.fromJson(map["position"]),
        address: map["address"],
      );

  String get geohash => _geoHasher.encode(position.longitude, position.latitude,
      precision: AppConfig.defaultGeoHashPrecision);

  Place.fromGoogleMapsPick(PickResult pickResult)
  : this(
        address: pickResult.formattedAddress!,
        position: Coordinate(pickResult.geometry!.location.lat, pickResult.geometry!.location.lng),
        );

  @override
  JsonMap toJson() => {"position": position.toJson(), "address": address};


  /// helper function to create demo points for testing
  Place.demo()
      : address = "Test adress",
        position = const Coordinate(20, 20);
}
