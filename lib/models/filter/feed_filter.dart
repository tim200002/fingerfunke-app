import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';

class FeedFilter extends Serializable {
  final int locationRadius;
  final bool hideFarFuture;

  FeedFilter(
      {required this.locationRadius,
      required this.hideFarFuture});

  factory FeedFilter.fallback() => FeedFilter(
      locationRadius: 30,  hideFarFuture: false);

  factory FeedFilter.fromJson(JsonMap map) => FeedFilter(
      locationRadius: map["locationRadius"],
      hideFarFuture: map["hideFarFuture"]);

  FeedFilter copyWith(
          {final int? locationRadius,
          final bool? hideCompleted,
          final bool? hideFarFuture}) =>
      FeedFilter(
          locationRadius: locationRadius ?? this.locationRadius,
          hideFarFuture: hideFarFuture ?? this.hideFarFuture);

  @override
  JsonMap toJson() => {
        "locationRadius": locationRadius,
        "hideFarFuture": hideFarFuture
      };
}
