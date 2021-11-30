import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final mainTheme = ThemeData(
      canvasColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(20)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(13)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.red))))),
      colorScheme: ColorScheme.light(
          primary: Colors.red,
          secondary: Colors.teal[100]!,
          onSecondary: Colors.black),
      textTheme: const TextTheme(
          headline3: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          headline4: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
      appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true, backgroundColor: Colors.transparent, foregroundColor: Colors.black));

  static TextStyle textStyleAccent({TextStyle? style}) =>
      GoogleFonts.calistoga(textStyle: style);

  // ignore: constant_identifier_names
  static const double PADDING_SIDE = 12;
}
