import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_list_event.dart';
part 'paginated_list_state.dart';
part 'paginated_list_bloc.freezed.dart';

class PaginatedListBloc<T>
    extends Bloc<PaginatedListEvent, PaginatedListState<T>> {
  final FirestorePaginationService _paginationService;
  late final StreamSubscription _itemsStreamSubscription;

  PaginatedListBloc({required FirestorePaginationService paginationService})
      : _paginationService = paginationService,
        super(PaginatedListState<T>(
            items: [], isLoading: true, reachedEnd: false)) {
    _itemsStreamSubscription = _paginationService.getItemsStream().listen(
          (items) => add(ItemsUpdated<T>(items as List<T>)),
        );

    on<RequestNewPage<T>>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      bool hasReachedEnd = await _paginationService.requestNewPage();
      emit(state.copyWith(isLoading: false, reachedEnd: hasReachedEnd));
    }, transformer: throttle(const Duration(milliseconds: 1000)));

    on<ItemsUpdated<T>>((event, emit) {
      emit(state.copyWith(items: event.items));
    });

    add(RequestNewPage<T>());
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  EventTransformer<T> throttle<T>(Duration duration) {
    return (events, mapper) =>
        events.throttle((_) => TimerStream(true, duration)).flatMap(mapper);
  }

  @override
  Future<void> close() {
    _itemsStreamSubscription.cancel();
    _paginationService.dispose();
    return super.close();
  }
}
