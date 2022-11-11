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
}
