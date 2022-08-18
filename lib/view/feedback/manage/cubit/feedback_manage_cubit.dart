import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user_feedback.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.impl.dart';

part 'feedback_manage_state.dart';
part 'feedback_manage_cubit.freezed.dart';

class FeedbackManageCubit extends Cubit<FeedbackManageState> {
  final UserFeedbackRepository _fbRepository = UserFeedbackRepositoryImpl();

  FeedbackManageCubit() : super(const FeedbackManageState.loading()) {
    _loadReports(true);
  }

  _loadReports(bool onlyOpen) {
    emit(const FeedbackManageState.loading());
    _fbRepository.getReports(onlyOpen: onlyOpen).then(
        (reports) => emit(FeedbackManageState.neutral(reports, onlyOpen)),
        onError: (e) => emit(FeedbackManageState.error(e)));
  }

  void toggleOnlyOpen() {
    state.whenOrNull(neutral: (_, onlyOpen) => _loadReports(!onlyOpen));
  }
}
