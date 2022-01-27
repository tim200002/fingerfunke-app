import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Contains customized Theme
class AppTheme {
  static const Color _light_primary = Color(0xffFF6060);
  static const Color _light_primaryVariant = Color(0xffF0ACB0);
  static const Color _light_onPrimary =  Color(0xffFFFFFF);
  static const Color _light_secondary = Color(0xff048D86);
  static const Color _light_secondaryVariant =  Color(0xff95CCC9);
  static const Color _light_onSecondary =  Color(0xffFFFFFF);
  static const Color _light_background =  Color(0xffF6F6F6);
  static const Color _light_onBackground =  Color(0xff151515);
  static const Color _light_onSurface =  Color(0xff151515);

  static const Color _dark_primary = Color(0xffFF6060);
  static const Color _dark_primaryVariant = Color(0xffF0ACB0);
  static const Color _dark_onPrimary =  Color(0xffFFFFFF);
  static const Color _dark_secondary = Color(0xff048D86);
  static const Color _dark_secondaryVariant =  Color(0xff95CCC9);
  static const Color _dark_onSecondary =  Color(0xffFFFFFF);
  static const Color _dark_onSurface =  Color(0xffF6F6F6);


  static final ThemeData mainTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: _light_primary,
        primaryVariant: _light_primaryVariant,
        onPrimary:  _light_onPrimary,
        secondary: _light_secondary,
        secondaryVariant:  _light_secondaryVariant,
        onSecondary:  _light_onSecondary,
        background:  _light_background,
        onBackground: _light_onBackground,
        onSurface:  _light_onSurface,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
    foregroundColor: _light_onSurface),
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
              borderRadius: BorderRadius.circular(10.0),
            )))),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: _textTheme,
    colorScheme: const ColorScheme.dark(
      primary: _dark_primary,
      primaryVariant: _dark_primaryVariant,
      onPrimary:  _dark_onPrimary,
      secondary: _dark_secondary,
      secondaryVariant:  _dark_secondaryVariant,
      onSecondary:  _dark_onSecondary,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: _dark_onSurface),
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
              borderRadius: BorderRadius.circular(10.0),
            )))),
  );

  static TextStyle textStyleAccent({TextStyle? style}) =>
      GoogleFonts.calistoga(textStyle: style);

  // ignore: constant_identifier_names
  static const double PADDING_SIDE = 12;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.roboto(
        fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.roboto(
        fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.roboto(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.roboto(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.roboto(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
