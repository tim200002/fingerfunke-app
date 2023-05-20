import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class FirebasePagedPAginatedList<T> extends StatelessWidget {
  /// Query to paginate
  final Query<T> query;

  /// function envoked on each list item to create widget given the data
  final Widget Function(T) itemBuilder;

  /// Element to show once reached end of list
  final Widget endIndicator;

  /// Element to show while loading new items
  final Widget loadingIndicator;

  /// Element to show while loading new items
  final Widget emptyListIndicator;

  /// pagination Distance, must be known to efficiently prefetch
  final int paginationDistance;

  /// starts loading new elements this many elements before reaching end
  final int prefetchDistance;

  const FirebasePagedPAginatedList(
      {required this.query,
      required this.itemBuilder,
      required this.endIndicator,
      required this.loadingIndicator,
      required this.emptyListIndicator,
      this.paginationDistance = 20,
      this.prefetchDistance = 3,
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
            return loadingIndicator;
          }

          // Nothing to show
          if (snapshot.docs.isEmpty) {
            return emptyListIndicator;
          }

          // Show Normal List
          return PageView.builder(
            scrollDirection: Axis.vertical,
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
                  return loadingIndicator;
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
