import 'package:flutter/material.dart';

class AppTheme {
  static final mainTheme = ThemeData(
      colorScheme: ColorScheme.light(
          primary: Colors.red,
          secondary: Colors.teal[100]!,
          onSecondary: Colors.black),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black));
}
