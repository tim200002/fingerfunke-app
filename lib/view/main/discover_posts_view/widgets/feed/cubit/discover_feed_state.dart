part of 'discover_feed_cubit.dart';

class DiscoverFeedState extends Equatable
    implements PaginatedListStateInterface<Post> {
  final List<Post>? _items;
  final bool _isLoading;
  final bool _reachedEnd;

  const DiscoverFeedState(
      {required List<Post>? items,
      required bool isLoading,
      required bool reachedEnd})
      : _items = items,
        _isLoading = isLoading,
        _reachedEnd = reachedEnd;

  @override
  List<Post>? get items => _items;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get reachedEnd => _reachedEnd;


  @override
  List<Object?> get props => [items, isLoading, reachedEnd];

          DiscoverFeedState copyWith(
          {List<Post>? items, bool? isLoading, bool? reachedEnd}) =>
          DiscoverFeedState(
          items: items ?? _items,
          isLoading: isLoading ?? _isLoading,
          reachedEnd: reachedEnd ?? _reachedEnd);
}
