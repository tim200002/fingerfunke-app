import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/illustration.dart';
import '../../utils/tools.dart';

class IllustrationView extends StatelessWidget {
  final String text;
  final Illustrations illustration;
  final double? illustrationWidth;
  final double illustrationHeight;
  final Function()? retry;
  final Widget? action;
  const IllustrationView(
      {super.key,
      required this.illustration,
      required this.text,
      this.illustrationWidth,
      this.illustrationHeight = 250,
      this.action,
      this.retry});

  const IllustrationView.empty({super.key, required this.text, this.retry})
      : illustration = Illustrations.empty,
        illustrationWidth = 200,
        illustrationHeight = 250,
        action = null;

  const IllustrationView.error({super.key, required this.text, this.retry})
      : illustration = Illustrations.parashute,
        illustrationWidth = 200,
        illustrationHeight = 140,
        action = null;

  static Widget retryButton(BuildContext context, Function() onPressed) =>
      TextButton.icon(
          icon: const Icon(Icons.refresh),
          onPressed: onPressed,
          label: Text(l10n(context).lbl_tryAgain));

  @override
  Widget build(BuildContext context) {
    assert(retry == null || action == null,
        "please only supply either an action or a retry function");
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Illustration(illustration,
                width: illustrationWidth, height: illustrationHeight),
            const SizedBox(
              height: 25,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.signika(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                )),
            if (action != null) action!,
            if (retry != null)
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: retryButton(context, retry!))
          ],
        ),
      ),
    );
  }
}
