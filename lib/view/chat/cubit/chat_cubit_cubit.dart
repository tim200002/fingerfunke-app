import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../../../cubits/paginated_list_cubit/paginated_list_cubit_interface.dart';
import '../../../cubits/paginated_list_cubit/paginated_list_state_interface.dart';
import '../../../models/message/message.dart';
import '../../../services/pagination/message_pagination_service.dart';
import '../../../utils/type_aliases.dart';

part 'chat_cubit_state.dart';

class ChatCubit extends Cubit<ChatState>
    implements PaginatedListCubitInterface {
  final MessagePaginationService _paginationService;
  late final StreamSubscription _itemsStreamSubscription;
  final Logger _logger = Logger();

  ChatCubit(FirestoreId postId)
      : _paginationService = MessagePaginationService(postId),
        super(const ChatState(items: null, isLoading: false, reachedEnd: false)) {
    _itemsStreamSubscription = _paginationService.getItemsStream().listen(
          (items) => emit(state.copyWith(items: items)),
        );
    requestNewPage();
  }
  @override
  Future<void> requestNewPage() async {
    _logger.i("Paginated list, load new page");
    // ToDo Frage sollten wir das hier machen, für mich gibt es keinen Grund warum nicht
    // es macht es halt minimimal intransparent, insbesondere da ich es in der Liste auch checke
    if (!state.reachedEnd) {
      emit(state.copyWith(isLoading: true));
      bool hasReachedEnd = await _paginationService.requestNewPage();
      emit(state.copyWith(isLoading: false, reachedEnd: hasReachedEnd));
    }
  }

  @override
  Future<void> close() {
    _itemsStreamSubscription.cancel();
    _paginationService.dispose();
    return super.close();
  }
}
