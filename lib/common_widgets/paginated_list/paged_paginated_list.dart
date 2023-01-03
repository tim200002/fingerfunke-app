import '../creation_aware_widget/creation_aware_widget.dart';
import 'package:flutter/material.dart';
import '../../cubits/paginated_list_cubit/paginated_list_state_interface.dart';

/// This is a template for a very easy paginated list
///
/// List must be wrapped with a bloc builder that handles rebuilding.
/// When giving it all the required parameters list will automatically
/// fetch new pages until it reached end
class PagedPaginatedList<T> extends StatelessWidget {
  /// state of the list, must confirm with the interface
  final PaginatedListStateInterface<T> state;

  /// function envoked on each list item to create widget given the data
  final Widget Function(T) _itemBuilder;


  /// Element to show once reached end of list
  final Widget endIndicator;

  /// Element to show while loading new items
  final Widget loadingIndicator;

  /// function to call to load new items
  final void Function() onRequestNewPage;

  final bool reverse;

  /// pagination Distance, must be known to efficiently prefetch
  final int paginationDistance;

  /// starts loading new elements this many elements before reaching end
  final int prefetch;


  const PagedPaginatedList(
      {required this.state,
      required Widget Function(T) itemBuilder,
      required this.onRequestNewPage,
      required this.endIndicator,
      required this.loadingIndicator,
      this.paginationDistance = 20,
      this.prefetch = 3,
      this.reverse = false,
      Key? key})
      : _itemBuilder = itemBuilder,
        super(key: key);

  /// if the current element created equals the last element of the list it is clear that we must load new ones
  ///
  /// If we would have reached end last element is not creation aware, could therefoe never trigger this
  /// ToDo we could look out for a better algorithm which fetches beforehand depending on pagination distance
  bool _shouldLoadNewItems(
      PaginatedListStateInterface<T> state, int currentIndex) {
    if (state.isLoading) return false;
    if (state.reachedEnd) return false;
    bool isInLastPage =
        (state.items!.length - (currentIndex + 1)) < paginationDistance;
    if (!isInLastPage) return false;
    int itemsTillEndOfPagination =
        (paginationDistance - (currentIndex + 1)) % paginationDistance;
    if (itemsTillEndOfPagination != prefetch) return false;
    return true;
  }

  bool _currentElementIsIndicator(
      PaginatedListStateInterface<T> state, int index) {
    return index == state.items!.length; }

  Widget? _createIndicator(
      PaginatedListStateInterface<T> state, BuildContext context) {
    if (state.isLoading) {
      return loadingIndicator;
    } else {
      return endIndicator;
    }
  }

  @override
  Widget build(BuildContext context) {
    return state.items != null ? PageView.builder(
      scrollDirection: Axis.vertical,
      // +1 to facilitate loading, end indicator
      itemCount: state.items!.length + 1,
      reverse: reverse,
      itemBuilder: (context, index) {
        //Check if we reached bottom of list
        // if yes shown indicator
        if (_currentElementIsIndicator(state, index)) {
          return _createIndicator(state, context) ?? Container();
        }
        // if not create element
        else {
          return CreationAwareWidget(
            child: _itemBuilder(state.items![index]),
            onItemCreated: () {
              if (_shouldLoadNewItems(state, index)) {
                onRequestNewPage();
              }
            },
          );
        }
      },
    ) : loadingIndicator ;
  }
}
