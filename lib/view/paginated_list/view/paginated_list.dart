import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:fingerfunke_app/view/paginated_list/bloc/paginated_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedList<T> extends StatelessWidget {
  final FirestorePaginationService _paginationService;
  final Function(T) _itemBuilder;

  final bool reverse;
  const PaginatedList(
      {required FirestorePaginationService firestorePaginationService,
      required Function(T) itemBuilder,
      this.reverse = false,
      Key? key})
      : _paginationService = firestorePaginationService,
        _itemBuilder = itemBuilder,
        super(key: key);

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
            return NotificationListener<UserScrollNotification>(
              onNotification: (UserScrollNotification scrollInfo) {
                if (!state.isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    scrollInfo.direction == ScrollDirection.forward) {
                  BlocProvider.of<PaginatedListBloc<T>>(context)
                      .add(RequestNewPage<T>());
                }
                return true;
              },
              child: ListView.builder(
                  itemCount: listItemCount,
                  reverse: reverse,
                  itemBuilder: (context, index) {
                    if (state.items.length != listItemCount) {
                      if (index == 0) {
                        if (state.isLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text("End of Dataset");
                        }
                      } else {
                        return _itemBuilder(state.items[index - 1]);
                      }
                    } else {}
                    return _itemBuilder(state.items[index]);
                  }),
            );
          },
        ),
      ),
    );
  }
}
