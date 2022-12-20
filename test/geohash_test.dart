import 'package:fingerfunke_app/utils/utility_classes/geohash.dart';
import 'package:test/test.dart';


void main() {
  test('Test GeoHasher', () {
    final geohash = GeoHasher();

    // region Test Decode
    expect(geohash.decode('0'), [-157.5, -67.5]);
    // Standard example with 9 character accuracy
    expect(
        geohash.decode('9v6kn87zg'), [-97.79499292373657, 30.23710012435913]);
    // Arbitrary accuracy. Only up to 12 characters accuracy can be achieved
    expect(geohash.decode('9v6kn87zgbbbbbbbbbb'),
        [-97.7949811566264, 30.237082819785357]);

    // Multiple ones that should throw an Exception
    expect(() => geohash.decode('a'), throwsArgumentError);
    expect(() => geohash.decode('-0'), throwsArgumentError);
    expect(() => geohash.decode(''), throwsArgumentError);
    //endregion

    // region Test Encode
    expect(geohash.encode(-157.5, -67.5, precision: 0), '');
    expect(geohash.encode(-97.79499292373657, 30.23710012435913, precision: 1),
        '9');
    expect(geohash.encode(-97.79499292373657, 30.23710012435913, precision: 9),
        '9v6kn87zg');
    expect(geohash.encode(-97.79499292373657, 30.23710012435913, precision: 10),
        '9v6kn87zgs');
    expect(geohash.encode(-97.79499292373657, 30.23710012435913, precision: 20),
        '9v6kn87zgs0000000000');
    expect(
        geohash.encode(-97.79499292373657, 30.23710012435913), '9v6kn87zgs00');

    // Multiple ones that should throw an Exception
    expect(() => geohash.encode(-181, 45), throwsArgumentError);
    expect(() => geohash.encode(45, 95), throwsArgumentError);
    //endregion

    //region Test neighbors
    expect(geohash.neighbors('9v6kn87zg'), {
      'NORTH': '9v6kn8eb5',
      'NORTHEAST': '9v6kn8ebh',
      'EAST': '9v6kn87zu',
      'SOUTHEAST': '9v6kn87zs',
      'SOUTH': '9v6kn87ze',
      'SOUTHWEST': '9v6kn87zd',
      'WEST': '9v6kn87zf',
      'NORTHWEST': '9v6kn8eb4',
      'CENTRAL': '9v6kn87zg',
    });

    // Multiple ones that should throw an Exception
    expect(() => geohash.neighbors('a'), throwsArgumentError);
    expect(() => geohash.neighbors('-0'), throwsArgumentError);
    expect(() => geohash.neighbors(''), throwsArgumentError);
    //endregion

    // test proximityHash
    print(geohash.getGeohashesWithinRadius(2.294776, 48.858156, 1000, precision: 7));
    expect(geohash.getGeohashesWithinRadius(2.294776, 48.858156, 1000, precision: 7).length, 600);

  });

  test('Test GeoHash', () {
    final geohash = GeoHash('9v6kn87zg');

    // Decimal accuracy, when not specified, is related to length of Geohash
    expect(geohash.longitude(), -97.79499292373657);
    // Decimals are rounded to nearest number keep that in mind when truncating
    expect(geohash.longitude(decimalAccuracy: 3), -97.795);

    // Decimal accuracy, when not specified, is related to length of Geohash
    expect(geohash.latitude(), 30.23710012435913);
    // Decimals are rounded to nearest number keep that in mind when truncating
    expect(geohash.latitude(decimalAccuracy: 3), 30.237);

    //region Test neighbor
    expect(geohash.neighbor(Direction.NORTH), '9v6kn8eb5');
    expect(geohash.neighbor(Direction.CENTRAL), '9v6kn87zg');

    // Neighbor Bool test. Requires same accuracy of geohash
    expect(geohash.isNeighbor('9v6kn8eb5'), true);
    expect(geohash.isNeighbor('9v6kn8'), false);
    expect(geohash.isNeighbor(''), false);
    expect(geohash.isNeighbor('9v6kn87zg'), true);

  });
}
