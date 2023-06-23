import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../repositories/report_repository/report_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/report.dart';

part 'mod_state.dart';
part 'mod_cubit.freezed.dart';

class ModCubit extends Cubit<ModState> {
  final ReportRepository _reportRepository = GetIt.I<ReportRepository>();
  final ReportType reportType;
  final Future Function(Report report) onReportAccepted;

  ModCubit({required this.reportType, required this.onReportAccepted})
      : super(const ModState.loading()) {
    loadReports();
  }

  loadReports() {
    //emit(ModPostState.loading());
    _reportRepository.getReports(onlyOpen: true, reportType: reportType).then(
        (reports) => emit(reports.isEmpty
            ? const ModState.empty()
            : ModState.neutral(reports.first, reports.length)),
        onError: (e) => emit(ModState.error(e)));
  }

  void closeReport(bool accept) {
    state.whenOrNull(neutral: (report, _) async {
      emit(const ModState.loading());

      await onReportAccepted(report);

      await _reportRepository.updateReport(report.copyWith(
          state: accept ? ReportState.accepted : ReportState.rejected));
    })?.then((_) => loadReports(), onError: (e) => emit(ModState.error(e)));
  }
}
