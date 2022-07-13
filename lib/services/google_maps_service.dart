import 'package:flutter_config/flutter_config.dart';

/// This service provides functions to generate Google Maps Queries
class GoogleMapsService {
  /// Generates a static Map google Maps query
  static Uri getGoogleStaticApiUri(String address) {
    String searchQuery = getSearchQuery(address);
    return Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        port: 443,
        path: '/maps/api/staticmap',
        queryParameters: {
          'size': '${600}x${300}',
          'center': '',
          'markers': searchQuery,
          'zoom': '15',
          'maptype': 'roadmap',
          'key': '${FlutterConfig.get('GOOGLE_MAPS_API_KEY')}'
        });
  }

  /// Generates a Google Maps link
  static Uri getGoogleUri(String address) {
    String searchQuery = getSearchQuery(address);
    return Uri(
        scheme: 'https',
        host: 'www.google.com',
        port: 443,
        path: '/maps/search/',
        queryParameters: {
          'api': '1',
          'query': searchQuery,
        });
  }

  static String getSearchQuery(String address) {
    String searchQuery;
    if (address == "") {
      searchQuery = '${0},${0}';
    } else {
      searchQuery = address;
    }
    return searchQuery;
  }
}
