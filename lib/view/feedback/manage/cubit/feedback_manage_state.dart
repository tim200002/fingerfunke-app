part of 'feedback_manage_cubit.dart';

@freezed
class FeedbackManageState with _$FeedbackManageState {
  const factory FeedbackManageState.loading() = _Loading;
  const factory FeedbackManageState.neutral(
      List<UserFeedback> feedback, bool showClosed) = _Neutral;
  const factory FeedbackManageState.error(dynamic e) = _Error;
}
