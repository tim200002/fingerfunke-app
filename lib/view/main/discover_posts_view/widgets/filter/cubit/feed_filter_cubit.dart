import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../repositories/storage_repository/storage_repository.dart';
import 'feed_filter_state.dart';



class FeedFilterCubit extends Cubit<FeedFilterState> {

  final StorageRepository _storageRepository;
  FeedFilterCubit({required StorageRepository storageRepository, required FeedFilterState? initialFeedFilterState}) : _storageRepository=storageRepository, super(initialFeedFilterState ?? const FeedFilterState(radius: 10, hideCompleted: false, hideFarFuture: true));

  void updateRadius(int radius) => _change(state.copyWith(radius: radius));

  void updateHidecCompleted(bool hideCompleted) => _change(state.copyWith(hideCompleted: hideCompleted));

  void updateHideFartFuture(bool hideFarFuture) => _change(state.copyWith(hideFarFuture: hideFarFuture));

  void _change(FeedFilterState changed) {
    _storageRepository.setFeedFilterSettings(changed);
    emit(changed);
  }
}
