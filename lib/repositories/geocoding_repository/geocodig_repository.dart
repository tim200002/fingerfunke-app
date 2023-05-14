import 'package:geocoding/geocoding.dart' as geocoding;

import '../../models/place.dart';

abstract class GeoCodingRepository{
  /// Convert a location given as a coordinate to a  place including the address
  static Future<Place> placeFromCoordinate(Coordinate position,
      [String? address]) async {
    address = address ?? (await _generateAddress(position));
    return Place(position: position, address: address);
  }

  /// Returns address of location
  static Future<String> _generateAddress(Coordinate position) async {
    List<geocoding.Placemark> placeMarks = await geocoding.placemarkFromCoordinates(position.latitude, position.longitude);
    return """${placeMarks[0].street}, ${placeMarks[0].postalCode} ${placeMarks[0].locality}, ${placeMarks[0].country}""";
  }
}