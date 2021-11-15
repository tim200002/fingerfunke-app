part of 'paginatedlist_cubit.dart';

@freezed
class PaginatedlistState<T> with _$PaginatedlistState<T> {
  const factory PaginatedlistState(
      {required List<T> items,
      required bool isLoading,
      required bool reachedEnd}) = _PaginatedlistState<T>;
}
