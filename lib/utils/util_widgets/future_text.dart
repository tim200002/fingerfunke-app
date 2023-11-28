import 'package:flutter/material.dart';

import '../skeleton_view.dart';

/// A utlity widget that displays a [Text] widget with a [Future] as its data.
/// If the future is complted the text is displayed
/// Otherwise loading is indicated using a shimmer effect
class FutureText extends StatefulWidget {
  final Future<String> text;
  final TextStyle? style;

  const FutureText(this.text, {this.style, super.key});

  @override
  State<FutureText> createState() => _FutureTextState();
}

class _FutureTextState extends State<FutureText> {
  String? displayText;

  @override
  void initState() {
    widget.text.then((value) => setState(() {
          displayText = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return displayText != null
        ? Text(displayText!, style: widget.style)
        : SkeletonView.shimmer(const SkeletonView.text());
  }
}
