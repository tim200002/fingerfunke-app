import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:fingerfunke_app/repositories/report_repository/report_repository.dart';
import 'package:fingerfunke_app/repositories/report_repository/report_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/report.dart';

part 'mod_post_state.dart';
part 'mod_post_cubit.freezed.dart';

class ModPostCubit extends Cubit<ModPostState> {
  final ReportRepository _reportRepository = ReportRepositoryImpl();
  final PostRepository _postRepository = PostRepositoryImpl();

  ModPostCubit() : super(const ModPostState.loading()) {
    loadReports();
  }

  loadReports() {
    //emit(ModPostState.loading());
    _reportRepository.getReports(onlyOpen: true).then(
        (reports) => emit(reports.isEmpty
            ? const ModPostState.empty()
            : ModPostState.neutral(reports.first, reports.length)),
        onError: (e) => emit(ModPostState.error(e)));
  }

  void closeReport(bool accept) {
    state.whenOrNull(neutral: (report, _) async {
      emit(const ModPostState.loading());
      if (report.type == ReportType.post) {
        if (accept) {
          await _postRepository.deletePost(report.objectReference);
        }
        await _reportRepository.updateReport(report.copyWith(
            state: accept ? ReportState.accepted : ReportState.rejected));
      }
    })?.then((_) => loadReports(), onError: (e) => emit(ModPostState.error(e)));
  }
}
