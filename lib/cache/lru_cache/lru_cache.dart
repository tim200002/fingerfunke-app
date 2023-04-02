import '../../utils/type_aliases.dart';

class LRUCache<T>{
  final int _capacity;
  final Map<FirestoreId, T> _map = {};

  LRUCache(this._capacity);

  T? get(FirestoreId key) {
    final value = _map.remove(key);

    if (value != null) {
      // put it back to the end of the map
      // this keeps the most recently used items at the end of the map
      _map[key] = value;
    }
    
    return value;
  }

  void put(FirestoreId key, T value) {
    if (_map.containsKey(key)) {
      _map.remove(key);
    } else if (_map.length >= _capacity) {
      _map.remove(_map.keys.first);
    }
    _map[key] = value;
  }

  void clear() {
    _map.clear();
  }

  int get length => _map.length;

  bool containsKey(FirestoreId key) => _map.containsKey(key);


}