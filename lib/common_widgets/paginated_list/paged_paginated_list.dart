import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/better_pagination/cubit/better_pagination_cubit.dart';
import '../../view/error/exception_view.dart';

class PagedPaginatedList<T> extends StatelessWidget {
  
  /// function envoked on each list item to create widget given the data
  final Widget Function(T) itemBuilder;

  /// Element to show once reached end of list
  final Widget endIndicator;

  /// Element to show while loading new items
  final Widget loadingIndicator;

  /// Element to show while loading new items
  final Widget emptyListIndicator;

  /// starts loading new elements this many elements before reaching end
  final int prefetchDistance;

  const PagedPaginatedList(
      {required this.itemBuilder,
      required this.endIndicator,
      required this.loadingIndicator,
      required this.emptyListIndicator,
      this.prefetchDistance = 3,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BetterPaginationCubit<T>, BetterPaginationState<T>>(
      builder: (context, state) {
        BetterPaginationState<T> snapshot = state;
        if (snapshot.hasError) {
          return ExceptionView(exception: snapshot.error);
        }
        if (snapshot.isFetching) {
          return loadingIndicator;
        }

        // Nothing to show
        if (snapshot.items.isEmpty) {
          return emptyListIndicator;
        }

        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.items.length + 1,
          itemBuilder: (context, index) {
            // if we reached the end of the currently obtained items, we try to
            // obtain more items
            if (!snapshot.isFetchingMore &&
                snapshot.hasMore &&
                index + prefetchDistance == snapshot.items.length) {
              // Tell FirestoreQueryBuilder to try to obtain more items.
              // It is safe to call this function from within the build method.
              context.read<BetterPaginationCubit<T>>().fetchNextPage();
            }

            // if we reached the end of the currently obtained items we must distinguish two cases
            if (index == snapshot.items.length) {
              // if we are currently fetching more items we show the loading indicator
              if (snapshot.isFetchingMore) {
                return loadingIndicator;
              }
              // if we are not fetching more items we reached the end of the list
              return endIndicator;
            }

            return itemBuilder(snapshot.items[index]);
          },
        );
      },
    );
  }
}
