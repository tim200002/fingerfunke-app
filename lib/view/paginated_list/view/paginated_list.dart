import 'package:fingerfunke_app/common_widgets/creation_aware_widget/creation_aware_widget.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:fingerfunke_app/view/paginated_list/bloc/paginated_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedList<T> extends StatelessWidget {
  final FirestorePaginationService _paginationService;
  final Widget Function(T) _itemBuilder;

  final bool reverse;
  const PaginatedList(
      {required FirestorePaginationService firestorePaginationService,
      required Widget Function(T) itemBuilder,
      this.reverse = false,
      Key? key})
      : _paginationService = firestorePaginationService,
        _itemBuilder = itemBuilder,
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
    return BlocProvider(
      create: (context) =>
          PaginatedListBloc<T>(paginationService: _paginationService),
      child: Builder(
        builder: (context) =>
            BlocBuilder<PaginatedListBloc<T>, PaginatedListState<T>>(
          builder: (context, state) {
            // is list is loading add one last item, showing loading indicator
            final listItemCount = state.items.length +
                (state.isLoading || state.reachedEnd ? 1 : 0);
            print("list item count $listItemCount");
            return ListView.builder(
              itemCount: listItemCount,
              reverse: reverse,
              itemBuilder: (context, index) {
                //Check if we reached bottom of list
                if (currentElementIsIndicator(
                    state.items.length, listItemCount, index)) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("End of Dataset");
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
        ),
      ),
    );
  }
}
