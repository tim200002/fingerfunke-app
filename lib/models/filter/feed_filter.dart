import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../place.dart';

class FeedFilter extends Serializable {
  final Place setLocation;
  final bool useSetLocation;
  final int locationRadius;
  final bool hideCompleted;
  final bool hideFarFuture;

  FeedFilter(
      {required this.setLocation,
      required this.locationRadius,
      required this.useSetLocation,
      required this.hideCompleted,
      required this.hideFarFuture});

  factory FeedFilter.fallback() => FeedFilter(
      setLocation: Place(
          position: const Coordinate(48.394312, 9.990687),
          address: "9XVR+P7 Ulm"),
      locationRadius: 30,
      useSetLocation: false,
      hideCompleted: false,
      hideFarFuture: false);

  factory FeedFilter.fromJson(JsonMap map) => FeedFilter(
      setLocation: Place.fromJson(map["savedLocation"]),
      useSetLocation: map["useSetLocation"],
      locationRadius: map["locationRadius"],
      hideCompleted: map["hideCompleted"],
      hideFarFuture: map["hideFarFuture"]);

  FeedFilter copyWith(
          {final Place? setLocation,
          final bool? useSetLocation,
          final int? locationRadius,
          final bool? hideCompleted,
          final bool? hideFarFuture}) =>
      FeedFilter(
          setLocation: setLocation ?? this.setLocation,
          locationRadius: locationRadius ?? this.locationRadius,
          useSetLocation: useSetLocation ?? this.useSetLocation,
          hideCompleted: hideCompleted ?? this.hideCompleted,
          hideFarFuture: hideFarFuture ?? this.hideFarFuture);

  @override
  JsonMap toJson() => {
        "savedLocation": setLocation.toJson(),
        "useSetLocation": useSetLocation,
        "locationRadius": locationRadius,
        "hideCompleted": hideCompleted,
        "hideFarFuture": hideFarFuture
      };
}
