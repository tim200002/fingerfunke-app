part of 'feedback_send_cubit.dart';

@freezed
class FeedbackSendState with _$FeedbackSendState {
  const factory FeedbackSendState.editing(
      List<UserFeedbackCategories> categories,
      TextEditingController title,
      TextEditingController description) = _Editing;
  const factory FeedbackSendState.sending() = _Sending;
  const factory FeedbackSendState.sent() = _Sent;
  const factory FeedbackSendState.error(dynamic e) = _Error;
}
