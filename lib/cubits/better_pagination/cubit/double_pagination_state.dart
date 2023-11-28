part of 'double_pagination_cubit.dart';

class DoublePaginationState<T> extends Equatable{
  final BetterPaginationState<T> paginationStateForward;
  final BetterPaginationState<T> paginationStateBackward;

  const DoublePaginationState({
    required this.paginationStateForward,
    required this.paginationStateBackward,
  });

  factory DoublePaginationState.initial() => DoublePaginationState<T>(
    paginationStateForward: BetterPaginationState<T>.initial(),
    paginationStateBackward: BetterPaginationState<T>.initial(),
  );

  DoublePaginationState<T> copyWith({
    BetterPaginationState<T>? paginationStateForward,
    BetterPaginationState<T>? paginationStateBackward,
  }) {
    return DoublePaginationState<T>(
      paginationStateForward: paginationStateForward ?? this.paginationStateForward,
      paginationStateBackward: paginationStateBackward ?? this.paginationStateBackward,
    );
  }

  bool get hasError => paginationStateForward.hasError || paginationStateBackward.hasError;
  Object? get error => paginationStateForward.error ?? paginationStateBackward.error;

  bool get isFetching => paginationStateForward.isFetching || paginationStateBackward.isFetching;

  List<T> get items => [
    ...paginationStateBackward.items.reversed,
    ...paginationStateForward.items,
  ];

  int get neutralIndex {
    // No Backward items, neutral pagination state is first forward item
    if(paginationStateBackward.items.isEmpty){
      return 0;
    }

    // No Forward items, neutral pagination state is last backward item
    if(paginationStateForward.items.isEmpty){
      return paginationStateBackward.items.length - 1;
    }

    // Both lists have items, neutral pagination state is first forward item
    return paginationStateBackward.items.length;
  } 

  @override
  List<Object?> get props => [
    paginationStateForward,
    paginationStateBackward,
  ];
}
