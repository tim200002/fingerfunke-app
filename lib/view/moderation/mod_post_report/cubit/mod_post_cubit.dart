import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/repositories/report_repository/report_repository.dart';
import 'package:fingerfunke_app/repositories/report_repository/report_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/report.dart';

part 'mod_post_state.dart';
part 'mod_post_cubit.freezed.dart';

class ModPostCubit extends Cubit<ModPostState> {
  final ReportRepository _reportRepository = ReportRepositoryImpl();

  ModPostCubit() : super(ModPostState.loading()) {
    loadReports();
  }

  loadReports() {
    //emit(ModPostState.loading());
    _reportRepository.getReports(onlyOpen: true).then(
        (reports) => emit(ModPostState.neutral(reports.first, reports.length)),
        onError: (e) => emit(ModPostState.error(e)));
  }
}
