import '../creation_aware_widget/creation_aware_widget.dart';
import 'package:flutter/material.dart';
import '../../cubits/paginated_list_cubit/paginated_list_state_interface.dart';

/// This is a template for a very easy paginated list
/// 
/// List must be wrapped with a bloc builder that handles rebuilding.
/// When giving it all the required parameters list will automatically 
/// fetch new pages until it reached end
class PaginatedList<T> extends StatelessWidget {
  /// state of the list, must confirm with the interface
  final PaginatedListStateInterface<T> state;

  /// function envoked on each list item to create widget given the data
  final Widget Function(T) _itemBuilder;

  /// function to call to load new items
  final void Function() onRequestNewPage;

  /// message displayed when list reached last element
  final String? endMessage;

  final Widget? endWidget;

  /// optional function to turn on and off shrinkWrap depending on the number of items in the list
  /// this is currently needed to shrink the list down in the comment section
  final bool Function(int)? shouldShrinkWrap;

  final bool reverse;

  /// what to show when list is loading new elements
  final Widget? loadingIndicator;

  const PaginatedList(
      {required this.state,
      required Widget Function(T) itemBuilder,
      required this.onRequestNewPage,
      this.reverse = false,
      this.endMessage,
      this.endWidget,
      this.shouldShrinkWrap,
      this.loadingIndicator,
      Key? key})
      : _itemBuilder = itemBuilder,
        super(key: key);

  /// if the current element created equals the last element of the list it is clear that we must load new ones
  ///
  /// If we would have reached end last element is not creation aware, could therefoe never trigger this
  /// ToDo we could look out for a better algorithm which fetches beforehand depending on pagination distance
  bool _shouldLoadNewItems(
      PaginatedListStateInterface<T> state, int currentIndex) {
    if (state.reachedEnd) {
      return false;
    }
    return currentIndex == state.items.length - 1;
  }

  bool _currentElementIsIndicator(
      PaginatedListStateInterface<T> state, int index) {
    return
        // we are in a state where we could show an indicator (loading or reached End)
        state.items.length != state.itemCount &&
            // the current index is the end, therefore the indicator
            index == state.itemCount - 1;
  }

  Widget? _createIndicator(
      PaginatedListStateInterface<T> state, BuildContext context) {
    if (state.isLoading) {
      return loadingIndicator;
    } else {
      return endWidget ??
          (endMessage != null
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.08),
                        ),
                        child: Text(endMessage!,
                            style: Theme.of(context).textTheme.labelMedium),
                      )),
                )
              : null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.itemCount,
      shrinkWrap:
          shouldShrinkWrap != null ? shouldShrinkWrap!(state.itemCount) : false,
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
            child: _itemBuilder(state.items[index]),
            onItemCreated: () {
              if (_shouldLoadNewItems(state, index)) {
                onRequestNewPage();
              }
            },
          );
        }
      },
    );
  }
}
