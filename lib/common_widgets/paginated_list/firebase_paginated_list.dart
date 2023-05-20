import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class FirebasePaginatedList<T> extends StatelessWidget {
  /// Query to paginate
  final Query<T> query;

  /// function envoked on each list item to create widget given the data
  final Widget Function(T) itemBuilder;

  /// Element to show once reached end of list
  final Widget endIndicator;

  // widget to show while the list is loading for the first time
  /// after the initialization
  final Widget initialLoadIndicator;

  /// Element to show while loading new items
  final Widget nextItemsLoadingIndicator;

  /// Element to show while loading new items
  final Widget emptyListIndicator;

  /// pagination Distance, must be known to efficiently prefetch
  final int paginationDistance;

  /// starts loading new elements this many elements before reaching end
  final int prefetchDistance;

  /// optional function to turn on and off shrinkWrap depending on the number of items in the list
  /// this is currently needed to shrink the list down in the comment section
  final bool Function(int)? shouldShrinkWrap;

  /// if true the list will be reversed
  final bool reverse;

  const FirebasePaginatedList(
      {required this.query,
      required this.itemBuilder,
      required this.endIndicator,
      required this.initialLoadIndicator,
      required this.nextItemsLoadingIndicator,
      required this.emptyListIndicator,
      this.paginationDistance = 20,
      this.prefetchDistance = 3,
      this.reverse = false,
      this.shouldShrinkWrap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<T>(
        query: query,
        pageSize: paginationDistance,
        builder: (context, snapshot, lastDocument) {
          if (snapshot.hasError) {
            return const Placeholder();
          }
          if (snapshot.isFetching) {
            return initialLoadIndicator;
          }

          // Nothing to show
          if (snapshot.docs.isEmpty) {
            return emptyListIndicator;
          }

          // Show Normal List
          return ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: reverse,
            shrinkWrap: shouldShrinkWrap != null
                ? shouldShrinkWrap!(snapshot.docs.length)
                : false,
            itemCount: snapshot.docs.length + 1,
            itemBuilder: (context, index) {
              // if we reached the end of the currently obtained items, we try to
              // obtain more items
              if (!snapshot.isFetchingMore &&
                  snapshot.hasMore &&
                  index + prefetchDistance == snapshot.docs.length) {
                // Tell FirestoreQueryBuilder to try to obtain more items.
                // It is safe to call this function from within the build method.
                snapshot.fetchMore();
              }

              // if we reached the end of the currently obtained items we must distinguish two cases
              if (index == snapshot.docs.length) {
                // if we are currently fetching more items we show the loading indicator
                if (snapshot.isFetchingMore) {
                  return nextItemsLoadingIndicator;
                }
                // if we are not fetching more items we reached the end of the list
                return endIndicator;
              }
              return itemBuilder(snapshot.docs[index].data());
            },
          );
        });
  }
}
