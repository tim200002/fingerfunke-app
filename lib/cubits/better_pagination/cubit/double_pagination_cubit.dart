import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'better_pagination_cubit.dart';

part 'double_pagination_state.dart';

class DoublePaginationCubit<T> extends Cubit<DoublePaginationState<T>> {
  final Query<T> _baseQueryForward;
  final Query<T> _baseQueryBackward;

  final int paginationDistance;

  int _pageCountForward = 0;
  int _pageCountBackward = 0;

  StreamSubscription? _querySubscriptionForward;
  StreamSubscription? _querySubscriptionBackward;

  DoublePaginationCubit(this._baseQueryForward, this._baseQueryBackward,
      {this.paginationDistance = 20})
      : super(DoublePaginationState<T>.initial()) {
    // Start with fetching first page
    _listenQuery(_baseQueryForward, _querySubscriptionForward,
        _pageCountForward, _getPaginationStateForward, _convertStateForward,
        nextPage: false);
    _listenQuery(_baseQueryBackward, _querySubscriptionBackward,
        _pageCountBackward, _getPaginationStateBackward, _convertStateBackward,
        nextPage: false);
  }

  void fetchNextPageForward() {
    BetterPaginationState<T> state = _getPaginationStateForward();
    if (state.isFetching || !state.hasMore || state.isFetchingMore) {
      return;
    }

    _pageCountForward++;
    _listenQuery(_baseQueryForward, _querySubscriptionForward,
        _pageCountForward, _getPaginationStateForward, _convertStateForward,
        nextPage: true);
  }

  void fetchNextPageBackward() {
    BetterPaginationState<T> state = _getPaginationStateBackward();
    if (state.isFetching || !state.hasMore || state.isFetchingMore) {
      return;
    }

    _pageCountBackward++;
    _listenQuery(_baseQueryBackward, _querySubscriptionBackward,
        _pageCountBackward, _getPaginationStateBackward, _convertStateBackward,
        nextPage: true);
  }

  void _listenQuery(
      Query<T> baseQuery,
      StreamSubscription? querySubscription,
      int pageCount,
      BetterPaginationState<T> Function() getState,
      DoublePaginationState<T> Function(BetterPaginationState<T>) convertState,
      {bool nextPage = false}) {
    querySubscription?.cancel();

    BetterPaginationState<T> localState = getState();

    // Trigger initial load
    if (nextPage) {
      localState = localState.copyWith(isFetchingMore: true);
    } else {
      localState = localState.copyWith(isFetching: true);
    }
    saveEmit(convertState(localState));

    final expectedDocsCount = (pageCount + 1) * paginationDistance

        /// The "+1" is used to voluntarily fetch one extra item,
        /// used to determine whether there is a next page or not.
        /// This extra item will not be rendered.
        +
        1;

    final query = baseQuery.limit(expectedDocsCount);

    querySubscription = query.snapshots().listen(
      (event) {
        BetterPaginationState<T> localState = getState();
        if (nextPage) {
          localState = localState.copyWith(isFetchingMore: false);
        } else {
          localState = localState.copyWith(isFetching: false);
        }
        localState = localState.copyWith(
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
        saveEmit(convertState(localState));
      },
      onError: (Object error, StackTrace stackTrace) {
        BetterPaginationState<T> localState = getState();
        if (nextPage) {
          localState = localState.copyWith(isFetchingMore: false);
        } else {
          localState = localState.copyWith(isFetching: false);
        }

        localState = localState.copyWith(
          error: error,
          hasError: true,
          hasMore: false,
        );

        saveEmit(convertState(localState));
      },
    );
  }

  BetterPaginationState<T> _getPaginationStateForward() {
    return state.paginationStateForward;
  }

  BetterPaginationState<T> _getPaginationStateBackward() {
    return state.paginationStateBackward;
  }

  DoublePaginationState<T> _convertStateForward(
      BetterPaginationState<T> localState) {
    return state.copyWith(paginationStateForward: localState);
  }

  DoublePaginationState<T> _convertStateBackward(
      BetterPaginationState<T> localState) {
    return state.copyWith(paginationStateBackward: localState);
  }

  /// Emit state only if cubit is not closed
  /// 
  /// For some reasons this is necessary because otherwise strea subscription
  /// can still fire even though the cubit is closed.
  void saveEmit(DoublePaginationState<T> state) {
    if (!isClosed) {
      emit(state);
    }
  }

  @override
  Future<void> close() async {
    await _querySubscriptionForward?.cancel();
    await _querySubscriptionBackward?.cancel();
    return super.close();
  }
}
