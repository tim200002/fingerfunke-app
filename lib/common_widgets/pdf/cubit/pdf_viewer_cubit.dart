import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_viewer_state.dart';
part 'pdf_viewer_cubit.freezed.dart';

class PdfViewerCubit extends Cubit<PdfViewerState> {
  final String downloadUrl;
  final CacheManager _cacheManager = DefaultCacheManager();
  PdfViewerCubit({required this.downloadUrl})
      : super(const PdfViewerState.loading()) {
    _loadPdf().then((value) {
      emit(PdfViewerState.loaded(pdfFile: value));
    }).catchError((error) {
      emit(PdfViewerState.error(error: error));
    });
  }

  Future<File> _loadPdf()async {
    final file = await _cacheManager.getSingleFile(downloadUrl);
    return file;
  }
}
