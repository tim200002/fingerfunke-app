import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/better_pagination/cubit/better_pagination_cubit.dart';
import '../../cubits/better_pagination/cubit/double_pagination_cubit.dart';
import '../../view/error/exception_view.dart';

class PagedPaginatedListDoubleDirection<T> extends StatelessWidget {
  
  /// function envoked on each list item to create widget given the data
  final Widget Function(T) itemBuilder;

  /// Element to show once reached end of list
  final Widget endIndicatorForward;

  // Element to show once reached end of list
  final Widget endIndicatorBackward;

  /// Element to show while loading new items
  final Widget loadingIndicator;

  /// Element to show while loading new items
  final Widget emptyListIndicator;

  /// starts loading new elements this many elements before reaching end
  final int prefetchDistance;

  PageController? _pageController;

  PagedPaginatedListDoubleDirection(
      {required this.itemBuilder,
      required this.endIndicatorForward,
      required this.endIndicatorBackward,
      required this.loadingIndicator,
      required this.emptyListIndicator,
      this.prefetchDistance = 3,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoublePaginationCubit<T>, DoublePaginationState<T>>(
      builder: (context, state) {
        if (state.hasError) {
          print(state.error);
          return ExceptionView(exception: state.error);
        }

        if (state.isFetching) {
          return loadingIndicator;
        }

        // Nothing to show
        if (state.items.isEmpty) {
          return emptyListIndicator;
        }

        // We have data to show first setup page controller if not happened yet, the use it
        // the +1 is to account for the end indicator at the beginning
        _pageController ??= PageController(initialPage: state.neutralIndex + 1);

        return PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemCount: state.items.length + 2,
          itemBuilder: (context, index) {
            
            // should we fetch more in forward direction
            int indexForward = index - state.paginationStateBackward.items.length;
            if(indexForward > 0 && shouldFetchNextPage(indexForward, state.paginationStateForward)){
              context.read<DoublePaginationCubit<T>>().fetchNextPageForward();
            }

            // should we fetch more in backward direction
            int indexBackward = state.paginationStateBackward.items.length - index;
            if(indexBackward < 0 && shouldFetchNextPage(indexBackward, state.paginationStateBackward)){
              context.read<DoublePaginationCubit<T>>().fetchNextPageBackward();
            }

            return _buildItem(index, state);
          },
        );
      },
    );
  }

  bool shouldFetchNextPage(int index, BetterPaginationState<T> state){
    return !state.isFetchingMore &&
                state.hasMore &&
                index + prefetchDistance == state.items.length;
  }

  Widget _buildItem(int index, DoublePaginationState<T> state){
     // check if we reached end in backward direction
     if(index == 0){
        if(state.paginationStateBackward.isFetchingMore){
          return loadingIndicator;
        }
        return endIndicatorBackward;
     }

      // check if we reached end in forward direction
      if(index == state.items.length + 1){
        if(state.paginationStateForward.isFetchingMore){
          return loadingIndicator;
        }
        return endIndicatorForward;
      }

      return itemBuilder(state.items[index - 1]);
  }

}
