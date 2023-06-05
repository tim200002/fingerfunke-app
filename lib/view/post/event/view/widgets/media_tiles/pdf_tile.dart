import 'package:flutter/material.dart';

import '../../../../../../common_widgets/pdf/full_scree_pdf_viewer.dart';
import 'media_tile.dart';

class PdfTile extends StatelessWidget {
  final String downloadUrl;
  const PdfTile({required this.downloadUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return MediaTile(
        onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FullscreenPdfViewer(downloadUrl: downloadUrl,)));
        },
        backgroundImage: const AssetImage("assets/img/illustrations/pdf.jpg"));
  }
}
