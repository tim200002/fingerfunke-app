import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'better_pagination_state.dart';

class BetterPaginationCubit<T> extends Cubit<BetterPaginationState<T>> {
  // Query to paginate from
  final Query<T> _baseQuery;

  final int paginationDistance;

  int _pageCount = 0;

  StreamSubscription? _querySubscription;

  BetterPaginationCubit(this._baseQuery, {this.paginationDistance = 20})
      : super(BetterPaginationState<T>.initial()){
        // Start with fetching first page
        _listenQuery(nextPage: false);
      }

  void fetchNextPage() {
    if (state.isFetching || !state.hasMore || state.isFetchingMore) {
      return;
    }

    _pageCount++;
    _listenQuery(nextPage: true);
  }

  void _listenQuery({bool nextPage = false}) {
    _querySubscription?.cancel();

    if (nextPage) {
      emit(state.copyWith(isFetchingMore: true));
    } else {
      emit(state.copyWith(isFetching: true));
    }

    final expectedDocsCount = (_pageCount + 1) * paginationDistance

        /// The "+1" is used to voluntarily fetch one extra item,
        /// used to determine whether there is a next page or not.
        /// This extra item will not be rendered.
        +
        1;

    final query = _baseQuery.limit(expectedDocsCount);

    _querySubscription = query.snapshots().listen(
      (event) {
        BetterPaginationState<T> snapshot = state;
        if (nextPage) {
          snapshot = snapshot.copyWith(isFetchingMore: false);
        } else {
          snapshot = snapshot.copyWith(isFetching: false);
        }
        snapshot = snapshot.copyWith(
          hasData: true,
          items: event.size < expectedDocsCount
              ? event.docs.map((e) => e.data()).toList()
              : event.docs
                  .take(expectedDocsCount - 1)
                  .map((e) => e.data())
                  .toList(),
          error: null,
          hasMore: event.size == expectedDocsCount,
          hasError: false,
        );
        emit(snapshot);
      },
      onError: (Object error, StackTrace stackTrace) {
        BetterPaginationState<T> snapshot = state;
        if (nextPage) {
          snapshot = snapshot.copyWith(isFetchingMore: false);
        } else {
          snapshot = snapshot.copyWith(isFetching: false);
        }

        snapshot = snapshot.copyWith(
          error: error,
          hasError: true,
          hasMore: false,
        );

        emit(snapshot);
      },
    );
  }

  @override
  Future<void> close() {
    _querySubscription?.cancel();
    return super.close();
  }
}
