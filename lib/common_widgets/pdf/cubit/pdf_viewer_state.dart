part of 'pdf_viewer_cubit.dart';

@freezed
class PdfViewerState with _$PdfViewerState {
  const factory PdfViewerState.loading() = _Loading;
  const factory PdfViewerState.loaded({required File pdfFile}) = _Loaded;
  const factory PdfViewerState.error({Object? error}) = _Error;
}
