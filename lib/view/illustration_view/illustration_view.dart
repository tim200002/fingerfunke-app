import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/illustration.dart';

class IllustrationView extends StatelessWidget {
  final String text;
  final String illustration;
  final double? illustrationWidth;
  const IllustrationView(
      {super.key,
      required this.text,
      required this.illustration,
      this.illustrationWidth});

  const IllustrationView.empty({super.key, required this.text})
      : illustration = Illustrations.empty,
        illustrationWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Illustration(
              illustration,
              height: null,
              width: illustrationWidth,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.signika(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
