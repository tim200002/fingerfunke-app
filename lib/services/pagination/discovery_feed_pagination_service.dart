import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/post/post.dart';
import '../../models/user_location.dart';
import '../../view/main/discover_posts_view/widgets/filter/cubit/feed_filter_cubit.dart';
import 'firestore_pagination_service.dart';

class DiscoveryFeedPaginationService extends FirestorePaginationService<Post> {
  final UserLocation userLocation;
  final FeedFilterState filters;

  DiscoveryFeedPaginationService(this.userLocation, this.filters,
      {FirebaseFirestore? firestore, int paginationDistance = 20})
      : super(
          (firestore ?? FirebaseFirestore.instance)
              .collection('posts')
              .where('geohashesByRadius.${filters.radius}',
                  arrayContains: userLocation.geohash)
              .orderBy('creationTime', descending: true),
          (QueryDocumentSnapshot postDocument) => Post.fromDoc(postDocument),
          paginationDistance: paginationDistance,
          firestore: (firestore ?? FirebaseFirestore.instance),
        ) {
    print(userLocation.geohash);
  }

  static _createQuery(FirebaseFirestore firestore,FeedFilterState filters){
    
  }
}
