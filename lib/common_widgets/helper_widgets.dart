import 'package:flutter/material.dart';

class HelperWidgets {
  static Widget materialHero({required String tag, required Widget child}) {
    return Hero(
        tag: tag,
        child: Material(type: MaterialType.transparency, child: child));
  }
}
