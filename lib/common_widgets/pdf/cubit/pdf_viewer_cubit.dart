import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_viewer_state.dart';
part 'pdf_viewer_cubit.freezed.dart';

class PdfViewerCubit extends Cubit<PdfViewerState> {
  final String downloadUrl;
  final Dio _dio = Dio();
  PdfViewerCubit({required this.downloadUrl})
      : super(const PdfViewerState.loading()) {
    _loadPdf().then((value) {
      emit(PdfViewerState.loaded(pdfData: value));
    }).catchError((error) {
      emit(PdfViewerState.error(error: error));
    });
  }

  Future<Uint8List> _loadPdf() async {
    final response = await _dio.get(downloadUrl,
        options: Options(responseType: ResponseType.bytes));
    return response.data;
  }
}
