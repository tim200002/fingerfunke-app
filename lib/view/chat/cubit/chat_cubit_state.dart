part of 'chat_cubit_cubit.dart';

@freezed
class ChatState  extends Equatable implements PaginatedListStateInterface<Message> { 

  final List<Message> _items;
  final bool _isLoading;
  final bool _reachedEnd;

  const ChatState(
      {required List<Message> items,
      required bool isLoading,
      required bool reachedEnd}):_items=items, _isLoading=isLoading, _reachedEnd=reachedEnd;

  @override
  List<Message> get items => _items;
  
  @override
  bool get isLoading => _isLoading;

  @override
  bool get reachedEnd => _reachedEnd;

  @override
  int get itemCount => _items.length;

  @override
  List<Object?> get props => [items, isLoading, reachedEnd];

  ChatState copyWith({List<Message>? items,
  bool? isLoading,
  bool? reachedEnd}) => ChatState(items: items ?? _items, isLoading: isLoading ?? _isLoading, reachedEnd: reachedEnd ?? _reachedEnd);
}
