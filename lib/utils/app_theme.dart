import 'package:flutter/material.dart';

class AppTheme {
  static final mainTheme = ThemeData(
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(20)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(20)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.red))))),
      colorScheme: ColorScheme.light(
          primary: Colors.red,
          secondary: Colors.teal[100]!,
          onSecondary: Colors.black),
      textTheme: TextTheme(
          headline4: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
      appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true, backgroundColor: Colors.transparent, foregroundColor: Colors.black));

  static const double PADDING_SIDE = 20;
}
