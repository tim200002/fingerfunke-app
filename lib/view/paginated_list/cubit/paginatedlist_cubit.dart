import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginatedlist_state.dart';
part 'paginatedlist_cubit.freezed.dart';

class PaginatedlistCubit<T> extends Cubit<PaginatedlistState<T>> {
  final FirestorePaginationService _paginationService;

  late final StreamSubscription _itemsStreamSubscription;
  PaginatedlistCubit({required FirestorePaginationService paginationService})
      : _paginationService = paginationService,
        super(PaginatedlistState<T>(
            items: [], isLoading: true, reachedEnd: false)) {
    _itemsStreamSubscription =
        _paginationService.getItemsStream().listen((items) {
      emit(state.copyWith(items: items as List<T>));
    });
    requestNewPage();
  }

  Future<void> requestNewPage() async {
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
