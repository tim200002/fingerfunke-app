import 'package:flutter/material.dart';

class InPastFilter extends StatelessWidget {
  final bool isInPast;
  final Widget child;

  const InPastFilter({super.key, required this.isInPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return isInPast
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.saturation,
            ),
            child: child)
        : child;
  }
}
