import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../view/error/exception_view.dart';
import 'cubit/pdf_viewer_cubit.dart';

class FullscreenPdfViewer extends StatelessWidget {
  final String downloadUrl;
  const FullscreenPdfViewer({required this.downloadUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF"),
      ),
      body: BlocProvider<PdfViewerCubit>(
        create: (_) => PdfViewerCubit(downloadUrl: downloadUrl),
        child: Builder(
          builder: (context) => BlocBuilder<PdfViewerCubit, PdfViewerState>(
            builder: (context, state) {
              return state.when(
                  loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                  loaded: (pdfData) => PDFView(
                        pdfData: pdfData,
                      ),
                  error: (error) => ExceptionView(exception: error));
            },
          ),
        ),
      ),
    );
  }
}
