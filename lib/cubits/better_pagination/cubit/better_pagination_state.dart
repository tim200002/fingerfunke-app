part of 'better_pagination_cubit.dart';

class BetterPaginationState<T> extends Equatable{
  final List<T> items;
  final Object? error;
  final bool hasData;
  final bool hasError;
  final bool hasMore;
  final bool isFetching;
  final bool isFetchingMore;

  const BetterPaginationState({
    required this.items,
    required this.error,
    required this.hasData,
    required this.hasError,
    required this.hasMore,
    required this.isFetching,
    required this.isFetchingMore,
  });

  // Create initial constructor
  factory BetterPaginationState.initial() => BetterPaginationState<T>(
        items: const [],
        error: null,
        hasData: false,
        hasError: false,
        hasMore: false,
        isFetching: true,
        isFetchingMore: false,
      );

  // Create copyWith constructor
  BetterPaginationState<T> copyWith({
    List<T>? items,
    Object? error,
    bool? hasData,
    bool? hasError,
    bool? hasMore,
    bool? isFetching,
    bool? isFetchingMore,
  }) {
    return BetterPaginationState<T>(
      items: items ?? this.items,
      error: error ?? this.error,
      hasData: hasData ?? this.hasData,
      hasError: hasError ?? this.hasError,
      hasMore: hasMore ?? this.hasMore,
      isFetching: isFetching ?? this.isFetching,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }

  @override
  List<Object?> get props => [
        items,
        error,
        hasData,
        hasError,
        hasMore,
        isFetching,
        isFetchingMore,
      ];
}
