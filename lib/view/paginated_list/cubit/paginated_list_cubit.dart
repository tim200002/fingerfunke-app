import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'paginated_list_state.dart';
part 'paginated_list_cubit.freezed.dart';

class PaginatedListCubit<T> extends Cubit<PaginatedListState<T>> {
  final FirestorePaginationService _paginationService;
  late final StreamSubscription _itemsStreamSubscription;

  final Logger _logger = Logger();
  PaginatedListCubit({required FirestorePaginationService paginationService})
      : _paginationService = paginationService,
        super(PaginatedListState<T>(
            items: [], isLoading: true, reachedEnd: false)) {
    _itemsStreamSubscription = _paginationService.getItemsStream().listen(
          (items) => emit(state.copyWith(items: items as List<T>)),
        );
    requestNewPage();
  }

  Future<void> requestNewPage() async {
    _logger.i("Paginated list, load new page");
    emit(state.copyWith(isLoading: true));
    bool hasReachedEnd = await _paginationService.requestNewPage();
    emit(state.copyWith(isLoading: false, reachedEnd: hasReachedEnd));
  }

  @override
  Future<void> close() {
    _itemsStreamSubscription.cancel();
    _paginationService.dispose();
    return super.close();
  }
}
