part of 'paginated_list_bloc.dart';

@freezed
class PaginatedListState<T> with _$PaginatedListState<T> {
  const factory PaginatedListState(
      {required List<T> items,
      required bool isLoading,
      required bool reachedEnd}) = _PaginatedlistState;
}
