import 'package:flutter/material.dart';

extension LightnessColor on Color {
  /// 1 would be the original color, 1.3 would be 30% brighter
  Color lighten(double amount) {
    final c = HSLColor.fromColor(this);
    return c.withLightness((c.lightness * amount).clamp(0.0, 1.0)).toColor();
  }
}
