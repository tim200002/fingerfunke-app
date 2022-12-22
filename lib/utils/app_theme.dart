// ignore_for_file: constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// color used for illustrations: #FF6060
// color used for illustrations: #9BDDDA

/// Contains customized Theme
class AppTheme {
  static const List<double> _textBodySizes = [13, 15, 17];

  static const Color _light_primary = Color(0xffFF6060);
  static const Color _light_primaryVariant = Color(0xffF0ACB0);
  static const Color _light_onPrimary = Color(0xffFFFFFF);
  static const Color _light_secondary = Color(0xffFF6060);
  static const Color _light_secondaryVariant = Color(0xff95CCC9);
  static const Color _light_onSecondary = Color(0xffFFFFFF);
  static const Color _light_background = Color(0xffF1F1F1);
  static const Color _light_onBackground = Color(0xff151515);
  static const Color _light_onSurface = Color(0xff151515);

  static const Color _dark_primary = Color(0xffFF6060);
  static const Color _dark_primaryVariant = Color(0xffF0ACB0);
  static const Color _dark_onPrimary = Color(0xffFFFFFF);
  static const Color _dark_secondary = Color(0xff048D86);
  static const Color _dark_secondaryVariant = Color(0xff95CCC9);
  static const Color _dark_background = Color(0xff151414);
  static const Color _dark_onSecondary = Color(0xffFFFFFF);
  static const Color _dark_onSurface = Color(0xffF6F6F6);

  static final ThemeData mainTheme = ThemeData(
    textTheme: _textTheme,
    primaryTextTheme: _textTheme.apply(bodyColor: Colors.white),
    canvasColor: const Color(0xffffffff),
    colorScheme: const ColorScheme.light(
      primary: _light_primary,
      primaryVariant: _light_primaryVariant,
      onPrimary: _light_onPrimary,
      secondary: _light_secondary,
      secondaryVariant: _light_secondaryVariant,
      onSecondary: _light_onSecondary,
      background: _light_background,
      onBackground: _light_onBackground,
      onSurface: _light_onSurface,
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
      onPrimary: _dark_onPrimary,
      secondary: _dark_secondary,
      secondaryVariant: _dark_secondaryVariant,
      onSecondary: _dark_onSecondary,
      background: _dark_background,
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

  static TextStyle textStyleCondensed({TextStyle? style}) =>
      GoogleFonts.robotoCondensed(textStyle: style);

  static const double PADDING_SIDE = 12;

  static final TextTheme _baseTheme = GoogleFonts.signikaTextTheme();
  static final TextTheme _textTheme = _baseTheme.copyWith(
    bodySmall: _baseTheme.bodySmall
        ?.copyWith(fontSize: _textBodySizes[0], color: Colors.black),
    bodyMedium: _baseTheme.bodyMedium?.copyWith(fontSize: _textBodySizes[1]),
    bodyLarge: _baseTheme.bodyLarge?.copyWith(fontSize: _textBodySizes[2]),
    labelSmall: _baseTheme.labelSmall
        ?.copyWith(fontSize: _textBodySizes[0], fontWeight: FontWeight.bold),
    labelMedium: _baseTheme.labelMedium
        ?.copyWith(fontSize: _textBodySizes[1], fontWeight: FontWeight.bold),
    labelLarge: _baseTheme.labelLarge
        ?.copyWith(fontSize: _textBodySizes[2], fontWeight: FontWeight.bold),
  );

  /*static final TextTheme _textTheme = TextTheme(
    headline1: _font_primary.copyWith(
        fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: _font_primary.copyWith(
        fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3:
        _font_primary.copyWith(fontSize: 48, fontWeight: FontWeight.w600),
    headline4: _font_primary.copyWith(
        fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 0.25),
    headline5:
        _font_primary.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
    headline6: _font_primary.copyWith(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: _font_primary.copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: _font_primary.copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: _font_primary.copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: _font_primary.copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: _font_primary.copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: _font_primary.copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: _font_primary.copyWith(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );*/
}
