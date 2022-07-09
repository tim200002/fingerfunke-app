import '../../../creation_aware_widget/creation_aware_widget.dart';
import '../cubit/paginated_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PagedPaginatedList<T> extends StatelessWidget {
  /// function envoked on each list item to create widget given the data
  final Widget Function(T) _itemBuilder;

  /// message displayed when list reached last element
  final Widget? endIndicator;

  /// optional function to turn on and off shrinkWrap depending on the number of items in the list
  /// this is currently needed to shrink the list down in the comment section
  final bool Function(int)? shouldShrinkWrap;

  final bool reverse;

  /// what to show when list is loading new elements
  final Widget? loadingIndicator;

  PagedPaginatedList(
      {required Widget Function(T) itemBuilder,
      this.reverse = false,
      this.endIndicator,
      this.shouldShrinkWrap,
      this.loadingIndicator,
      Key? key})
      : _itemBuilder = itemBuilder,
        super(key: key);

  /// if the current element created equals the last element of the list it is clear that we must load new ones
  ///
  /// If we would have reached end last element is not creation aware, could therefoe never trigger this
  /// ToDo we could look out for a better algorithm which fetches beforehand depending on pagination distance
  bool _shouldLoadNewItems(PaginatedListState<T> state, int currentIndex) {
    if (state.reachedEnd) {
      return false;
    }
    return currentIndex == state.items.length - 1;
  }

  bool _currentElementIsIndicator(PaginatedListState<T> state, int index) {
    return
        // we are in a state where we could show an indicator (loading or reached End)
        state.items.length != state.itemCount &&
            // the current index is the end, therefore the indicator
            index == state.itemCount - 1;
  }

  Widget? _createIndicator(PaginatedListState<T> state, BuildContext context) {
    if (state.isLoading) {
      return loadingIndicator;
    } else {
      return endIndicator != null ? Center(child: endIndicator) : null;
    }
  }

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListCubit<T>, PaginatedListState<T>>(
      builder: (context, state) {
        return PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemCount: state.itemCount,
          itemBuilder: (context, index) {
            //Check if we reached bottom of list
            // if yes shown indicator
            if (_currentElementIsIndicator(state, index)) {
              return _createIndicator(state, context) ?? Container();
            }
            // if not create element
            else {
              return CreationAwareWidget(
                child: _itemBuilder(state.items[index]),
                onItemCreated: () {
                  if (_shouldLoadNewItems(state, index)) {
                    BlocProvider.of<PaginatedListCubit<T>>(context)
                        .requestNewPage();
                  }
                },
              );
            }
          },
        );
      },
    );
  }
}
