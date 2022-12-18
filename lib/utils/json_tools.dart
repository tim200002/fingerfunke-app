import 'tools.dart';
import 'type_aliases.dart';

class JsonTools {
  static T? nullable<T>(JsonMap map, String key) {
    try {
      return (map[key] as T);
    } catch (e) {
      return null;
    }
  }

  static List<T>? nullableList<T>(
      JsonMap map, String key, T Function(dynamic value) parse) {
    try {
      List<T> result = [];
      for (var e in (map[key] as List<dynamic>)) {
        result.add(parse(e));
      }
      return result;
    } catch (e) {
      logger.v("nullableList error ", e);
      return null;
    }
  }
}
