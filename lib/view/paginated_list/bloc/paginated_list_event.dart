part of 'paginated_list_bloc.dart';

@freezed
class PaginatedListEvent<T> with _$PaginatedListEvent<T> {
  const factory PaginatedListEvent.requestNewPage() = RequestNewPage;
  const factory PaginatedListEvent.itemsUpdated(List<T> items) = ItemsUpdated;
}
