import 'package:fingerfunke_app/common_widgets/creation_aware_widget/creation_aware_widget.dart';
import 'package:fingerfunke_app/view/paginated_list/bloc/paginated_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedList<T> extends StatelessWidget {
  /// function envoked on each list item to create widget given the data
  final Widget Function(T) _itemBuilder;

  /// message displayed when list reached last element
  final String? endMessage;

  /// optional function to turn on and off shrinkWrap depending on the number of items in the list
  /// this is currently needed to shrink the list down in the comment section
  final bool Function(int)? shouldShrinkWrap;

  final bool reverse;
  const PaginatedList(
      {required Widget Function(T) itemBuilder,
      this.reverse = false,
      this.endMessage,
      this.shouldShrinkWrap,
      Key? key})
      : _itemBuilder = itemBuilder,
        super(key: key);


  bool shouldLoadNewItems(
      PaginatedListState<T> state, int currentIndex, int listItemCount) {
    return currentIndex == listItemCount - 2 &&
        !state.isLoading &&
        !state.reachedEnd;
  }

  bool currentElementIsIndicator(numberOfRealItems, listItemCount, index) {
    return numberOfRealItems != listItemCount && index == listItemCount - 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<T>, PaginatedListState<T>>(
      builder: (context, state) {
        // is list is loading add one last item, showing loading indicator
        final listItemCount = state.items.length +
            (state.isLoading || state.reachedEnd ? 1 : 0);
        return ListView.builder(
          itemCount: listItemCount,
          shrinkWrap: shouldShrinkWrap != null
              ? shouldShrinkWrap!(listItemCount)
              : false,
          reverse: reverse,
          itemBuilder: (context, index) {
            //Check if we reached bottom of list
            if (currentElementIsIndicator(
                state.items.length, listItemCount, index)) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return endMessage != null
                    ? Center(child: Text(endMessage!))
                    : Container();
              }
            }
            return CreationAwareWidget(
              child: _itemBuilder(state.items[index]),
              onItemCreated: () {
                if (shouldLoadNewItems(state, index, listItemCount)) {
                  BlocProvider.of<PaginatedListBloc<T>>(context)
                      .add(RequestNewPage<T>());
                }
              },
            );
          },
        );
      },
    );
  }
}
