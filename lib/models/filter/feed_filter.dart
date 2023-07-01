import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';

enum FeedSortBy { eventDate, creationDate }
class FeedFilter extends Serializable {
  final int locationRadius;
  final bool hideFarFuture;
  final FeedSortBy sortBy;

  FeedFilter(
      {required this.locationRadius,
      required this.hideFarFuture,
      required this.sortBy});

  factory FeedFilter.fallback() => FeedFilter(
      locationRadius: 30,  hideFarFuture: false, sortBy: FeedSortBy.creationDate);

  factory FeedFilter.fromJson(JsonMap map) => FeedFilter(
      locationRadius: map["locationRadius"],
      hideFarFuture: map["hideFarFuture"],
      sortBy: (map["sortBy"] != null)? FeedSortBy.values.firstWhere((element) => element.name == map["sortBy"]): FeedSortBy.creationDate
      );

  FeedFilter copyWith(
          {final int? locationRadius,
          final bool? hideCompleted,
          final bool? hideFarFuture,
          final FeedSortBy? sortBy
          }) =>
      FeedFilter(
          locationRadius: locationRadius ?? this.locationRadius,
          hideFarFuture: hideFarFuture ?? this.hideFarFuture,
          sortBy: sortBy ?? this.sortBy
      );

  @override
  JsonMap toJson() => {
        "locationRadius": locationRadius,
        "hideFarFuture": hideFarFuture,
        "sortBy": sortBy.name
      };
}
