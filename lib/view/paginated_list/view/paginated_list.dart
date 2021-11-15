import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginatedlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedList<T> extends StatelessWidget {
  final FirestorePaginationService _paginationService;
  final Function(T) _itemBuilder;
  const PaginatedList(
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
          PaginatedlistCubit<T>(paginationService: _paginationService),
      child: Builder(
        builder: (context) =>
            BlocListener<PaginatedlistCubit<T>, PaginatedlistState<T>>(
          listener: (context, state) {
            if (state.isLoading) {
              Tools.showSnackbar(context, "loading new posts");
            }
            if (state.reachedEnd) {
              Tools.showSnackbar(context, "reached End");
            }
          },
          child: BlocBuilder<PaginatedlistCubit<T>, PaginatedlistState<T>>(
            buildWhen: (prev, curr) => prev.items != curr.items,
            builder: (context, state) =>
                NotificationListener<ScrollEndNotification>(
              onNotification: (scrollEnd) {
                var metrics = scrollEnd.metrics;
                if (metrics.atEdge && metrics.pixels != 0) {
                  BlocProvider.of<PaginatedlistCubit>(context).requestNewPage();
                }
                return true;
              },
              child: ListView.builder(
                itemCount: state.items.length,
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
