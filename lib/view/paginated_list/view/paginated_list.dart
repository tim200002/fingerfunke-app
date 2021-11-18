import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/paginated_list/bloc/paginated_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedList<T> extends StatelessWidget {
  final FirestorePaginationService _paginationService;
  final Function(T) _itemBuilder;
  PaginatedList(
      {required FirestorePaginationService firestorePaginationService,
      required Function(T) itemBuilder,
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
            BlocListener<PaginatedListBloc<T>, PaginatedListState<T>>(
          listener: (context, state) {
            if (state.isLoading) {
              Tools.showSnackbar(context, "loading new posts");
            }
            if (state.reachedEnd) {
              Tools.showSnackbar(context, "reached End");
            }
          },
          child: BlocBuilder<PaginatedListBloc<T>, PaginatedListState<T>>(
            builder: (context, state) =>
                NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!state.isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  BlocProvider.of<PaginatedListBloc<T>>(context)
                      .add(RequestNewPage<T>());
                }
                return true;
              },
              child: ListView.builder(
                itemCount: state.items.length,
                reverse: true,
                itemBuilder: (context, index) =>
                    _itemBuilder(state.items[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
