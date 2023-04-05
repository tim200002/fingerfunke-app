import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../place.dart';

class FeedFilter extends Serializable {
  final int locationRadius;
  final bool hideCompleted;
  final bool hideFarFuture;

  FeedFilter(
      {
      required this.locationRadius,
      required this.hideCompleted,
      required this.hideFarFuture});

  factory FeedFilter.fallback() => FeedFilter(
      locationRadius: 30,
      hideCompleted: false,
      hideFarFuture: false);

  factory FeedFilter.fromJson(JsonMap map) => FeedFilter(
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
          locationRadius: locationRadius ?? this.locationRadius,
          hideCompleted: hideCompleted ?? this.hideCompleted,
          hideFarFuture: hideFarFuture ?? this.hideFarFuture);

  @override
  JsonMap toJson() => {
        "locationRadius": locationRadius,
        "hideCompleted": hideCompleted,
        "hideFarFuture": hideFarFuture
      };
}
