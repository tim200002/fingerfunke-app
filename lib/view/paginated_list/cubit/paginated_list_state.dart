part of 'paginated_list_cubit.dart';

@freezed
class PaginatedListState<T> with _$PaginatedListState<T> {
  const PaginatedListState._();
  const factory PaginatedListState(
      {required List<T> items,
      required bool isLoading,
      required bool reachedEnd}) = _PaginatedlistState;

  get itemCount {
    return items.length + (isLoading || reachedEnd ? 1 : 0);
  }
}

