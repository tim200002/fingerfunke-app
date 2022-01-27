import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _primary = Color(0xFFFF2B4E);
const Color primaryTEMP = Color(0xFFfc5a75);
const Color _secondary = Color(0xFF8BC9C5); //Color(0xFF059F95);

class AppTheme {
  static Color get colorPrimary => _primary;

  // TODO: change variable to function, to allow for Textsize change
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
                      side: const BorderSide(color: _primary))))),
      colorScheme: const ColorScheme.light(
          primary: _primary, secondary: _secondary, onSecondary: Colors.black),
      textTheme: const TextTheme(
          headline3: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          headline4: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
      appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true, backgroundColor: Colors.transparent, foregroundColor: Colors.black));

  static final darkTheme = ThemeData.dark().copyWith(
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(20)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(13)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: const BorderSide(color: Colors.red))))),
  );

  static TextStyle textStyleAccent({TextStyle? style}) =>
      GoogleFonts.calistoga(textStyle: style);

  // ignore: constant_identifier_names
  static const double PADDING_SIDE = 12;
}
