import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../../../../cubits/paginated_list_cubit/paginated_list_cubit_interface.dart';
import '../../../../../../cubits/paginated_list_cubit/paginated_list_state_interface.dart';
import '../../../../../../models/post/post.dart';
import '../../../../../../models/user_location.dart';
import '../../../../../../services/pagination/discovery_feed_pagination_service.dart';
import '../../filter/cubit/feed_filter_cubit.dart';

part 'discover_feed_state.dart';

class DiscoverFeedCubit extends Cubit<DiscoverFeedState>
    implements PaginatedListCubitInterface {
  final Logger _logger = Logger();
  late DiscoveryFeedPaginationService _paginationService;
  late StreamSubscription _itemsStreamSubscription;

  DiscoverFeedCubit(
      {required UserLocation userLocation, required FeedFilterState filters})
      : super(const DiscoverFeedState(
            items: null, isLoading: false, reachedEnd: false)) {
    _paginationService = DiscoveryFeedPaginationService(userLocation, filters);
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
