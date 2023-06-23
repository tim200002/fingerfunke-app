import 'package:bloc/bloc.dart';
import '../../../models/abstract_models/abstract_models.dart';
import '../../../models/report.dart';
import '../../../models/user/user.dart';
import '../../../repositories/report_repository/report_repository.dart';
import '../../../repositories/report_repository/report_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'report_send_state.dart';
part 'report_send_cubit.freezed.dart';

class ReportSendCubit extends Cubit<ReportSendState> {
  final ReportRepository _reportRepository = ReportRepositoryImpl();
  final UserInfo author;
  ReportSendCubit(
      {required UserGeneratedDocument doc,
      required ReportType type,
      required this.author})
      : super(ReportSendState.editing(doc, type, []));

  void setReasons(List<ReportReason> reasons) {
    state.whenOrNull(
        editing: ((doc, type, _) =>
            emit(ReportSendState.editing(doc, type, reasons))));
  }

  /// Sends the report to the server
  /// 
  /// [fullPathPrimer] is the pre path before the id of the object that is being reported
  void send(String fullPathPrimer) {
    state.whenOrNull(
      editing: (doc, type, reasons) async {
        emit(const ReportSendState.sending());
        if (reasons.isEmpty) return;
        Report report = Report(
          authorId: author.id,
          reasons: reasons,
          creationTime: DateTime.now(),
          type: type,
          objectReference: doc.id,
          objectReferenceFullPath: p.join(fullPathPrimer, doc.id)
        );
        _reportRepository.createReport(report).then(
            (value) => emit(const ReportSendState.sent()),
            onError: (e) => emit(ReportSendState.error(e)));
      },
    );
  }
}
