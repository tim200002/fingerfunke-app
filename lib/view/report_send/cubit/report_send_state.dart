part of 'report_send_cubit.dart';

@freezed
class ReportSendState with _$ReportSendState {
  const factory ReportSendState.editing(UserGeneratedDocument doc,
      ReportType type, List<ReportReason> reasons) = _Editing;
  const factory ReportSendState.sending() = _Sending;
  const factory ReportSendState.sent() = _Sent;
  const factory ReportSendState.error(dynamic e) = _Error;
}
