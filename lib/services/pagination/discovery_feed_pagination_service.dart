import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/filter/feed_filter.dart';
import '../../models/post/post.dart';
import '../../models/place.dart';
import 'firestore_pagination_service.dart';

class DiscoveryFeedPaginationService extends FirestorePaginationService<Post> {
  final Place userLocation;
  final FeedFilter filters;

  DiscoveryFeedPaginationService(this.userLocation, this.filters,
      {FirebaseFirestore? firestore, int paginationDistance = 20})
      : super(
          _createQuery(
              firestore ?? FirebaseFirestore.instance, userLocation, filters),
          (QueryDocumentSnapshot postDocument) => Post.fromDoc(postDocument),
          paginationDistance: paginationDistance,
          firestore: (firestore ?? FirebaseFirestore.instance),
        );
  static Query<Map<String, dynamic>> _createQuery(
      FirebaseFirestore firestore, Place userLocation, FeedFilter filters) {
    Query<Map<String, dynamic>> query = firestore.collection('posts').where(
        'geohashesByRadius.${filters.locationRadius}',
        arrayContains: userLocation.geohash);

    if (filters.hideFarFuture) {
      DateTime farFuture = DateTime.now();
      farFuture = farFuture.add(const Duration(days: 30));
      query = query.where('startTime',
          isLessThanOrEqualTo: farFuture.millisecondsSinceEpoch);
    }

    if (filters.hideCompleted) {
      query = query.where('startTime',
          isGreaterThanOrEqualTo: DateTime.now().millisecondsSinceEpoch);
    }

    // ugly hack: Problem after inqequylity first order by must start with same field
    query =
        query.orderBy('startTime').orderBy('creationTime', descending: true);

    return query;
  }
}
