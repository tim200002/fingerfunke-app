import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../models/filter/feed_filter.dart';
import '../../../../../../repositories/storage_repository/storage_repository.dart';
import '../../../../../../services/session_info_service.dart';

class FeedFilterCubit extends Cubit<FeedFilter> {
  final StorageRepository _storageRepository;
  FeedFilterCubit._(this._storageRepository)
      : super(_storageRepository.getFeedFilter() ?? FeedFilter.fallback());

  factory FeedFilterCubit.create() =>
      FeedFilterCubit._(StorageRepositoryImpl());

  void update(FeedFilter Function(FeedFilter) u) => set(u.call(state));

  void set(FeedFilter changed) {
    _storageRepository.setFeedFilter(changed);
    emit(changed);
    SessionInfoService.instance.setLocationDistance(changed.locationRadius);
  }
}
