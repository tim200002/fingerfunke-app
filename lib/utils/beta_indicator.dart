import 'package:flutter/material.dart';

class BetaIndicator extends StatelessWidget {
  final String message;
  const BetaIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const double indent = 10;

    return CustomPaint(
        painter: const _Chevron(Colors.blue, indent),
        child: Container(
          margin: const EdgeInsets.only(right: indent),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Text(
            message, //"βeta",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
          ),
        ));
  }
}

class _Chevron extends CustomPainter {
  final Color color;
  final double indent;
  const _Chevron(this.color, this.indent);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - indent, size.height / 2)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_) => false;
}
