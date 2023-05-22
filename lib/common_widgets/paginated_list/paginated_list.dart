import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/better_pagination/cubit/better_pagination_cubit.dart';
import '../../view/error/exception_view.dart';

class PaginatedList<T> extends StatelessWidget {
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

  /// starts loading new elements this many elements before reaching end
  final int prefetchDistance;

  /// optional function to turn on and off shrinkWrap depending on the number of items in the list
  /// this is currently needed to shrink the list down in the comment section
  final bool Function(int)? shouldShrinkWrap;

  /// if true the list will be reversed
  final bool reverse;

  /// If context cannot be used for reading the cubit, the cubit can be passed directly
  final BetterPaginationCubit<T>? cubit;

  const PaginatedList(
      {required this.itemBuilder,
      required this.endIndicator,
      required this.initialLoadIndicator,
      required this.nextItemsLoadingIndicator,
      required this.emptyListIndicator,
      this.prefetchDistance = 3,
      this.reverse = false,
      this.shouldShrinkWrap,
      this.cubit,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BetterPaginationCubit<T>, BetterPaginationState<T>>(
      bloc: cubit,
      builder: (context, state) {
          
      BetterPaginationState<T> snapshot = state;
      if (snapshot.hasError) {
        return ExceptionView(exception: snapshot.error);
      }
      if (snapshot.isFetching) {
        return initialLoadIndicator;
      }

      // Nothing to show
      if (snapshot.items.isEmpty) {
        return emptyListIndicator;
      }

      // Show Normal List
      return ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: reverse,
        shrinkWrap: shouldShrinkWrap != null
            ? shouldShrinkWrap!(snapshot.items.length)
            : false,
        itemCount: snapshot.items.length + 1,
        itemBuilder: (context, index) {
          // if we reached the end of the currently obtained items, we try to
          // obtain more items
          if (!snapshot.isFetchingMore &&
              snapshot.hasMore &&
              index + prefetchDistance == snapshot.items.length) {
            // Tell FirestoreQueryBuilder to try to obtain more items.
            // It is safe to call this function from within the build method.
            if(cubit != null){
              cubit!.fetchNextPage();
            }else{
              context.read<BetterPaginationCubit<T>>().fetchNextPage();
            }
          }

          // if we reached the end of the currently obtained items we must distinguish two cases
          if (index == snapshot.items.length) {
            // if we are currently fetching more items we show the loading indicator
            if (snapshot.isFetchingMore) {
              return nextItemsLoadingIndicator;
            }
            // if we are not fetching more items we reached the end of the list
            return endIndicator;
          }
          return itemBuilder(snapshot.items[index]);
        },
      );
    });
  }
}
