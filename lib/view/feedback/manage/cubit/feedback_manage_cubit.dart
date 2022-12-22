import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user_feedback.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.impl.dart';
import '../../../../utils/tools.dart';

part 'feedback_manage_cubit.freezed.dart';
part 'feedback_manage_state.dart';

class FeedbackManageCubit extends Cubit<FeedbackManageState> {
  StreamSubscription<List<UserFeedback>>? _subscription;
  final UserFeedbackRepository _fbRepository = UserFeedbackRepositoryImpl();

  FeedbackManageCubit() : super(const FeedbackManageState.loading()) {
    _loadReports(true);
  }

  _loadReports(bool onlyOpen) async {
    emit(const FeedbackManageState.loading());
    await _subscription?.cancel();
    _subscription =
        _fbRepository.observeReports(onlyOpen: onlyOpen).listen((r) {
      logger.d("snappyshot");
      emit(FeedbackManageState.neutral(List.of(r), onlyOpen));
    }, onError: (e) => emit(FeedbackManageState.error(e)));
  }

  void toggleOnlyOpen() {
    state.whenOrNull(neutral: (_, onlyOpen) => _loadReports(!onlyOpen));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
