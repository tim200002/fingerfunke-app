import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A set of colors based on the
/// [Material Design 3](https://m3.material.io/styles/color/the-color-system/key-colors-tones)
/// that can be used to configure the color properties of most components.
///
/// Because Flutter still uses Material Design 2, currently only some colors are used.
class MaterialYouColors {
  static const Color _light_primary = Color(0xFFba172a);
  static const Color _light_onPrimary = Color(0xFFffffff);
  static const Color _light_primaryContainer = Color(0xFFffdad6);
  static const Color _light_onPrimaryContainer = Color(0xFF410005);
  static const Color _light_secondary = Color(0xFF006a64);
  static const Color _light_onSecondary = Color(0xFFffffff);
  static const Color _light_secondaryContainer = Color(0xFF71f7ed);
  static const Color _light_onSecondaryContainer = Color(0xFF00201d);
  static const Color _light_tertiary = Color(0xFF735a2e);
  static const Color _light_onTertiary = Color(0xFFffffff);
  static const Color _light_tertiaryContainer = Color(0xFFffdea7);
  static const Color _light_onTertiaryContainer = Color(0xFF281900);
  static const Color _light_error = Color(0xFFba1b1b);
  static const Color _light_errorContainer = Color(0xFFffdad4);
  static const Color _light_onError = Color(0xFFffffff);
  static const Color _light_onErrorContainer = Color(0xFF410001);
  static const Color _light_background = Color(0xFFfcfcfc);
  static const Color _light_onBackground = Color(0xFF201a1a);
  static const Color _light_surface = Color(0xFFfcfcfc);
  static const Color _light_onSurface = Color(0xFF201a1a);
  static const Color _light_surfaceVariant = Color(0xFFf4dddb);
  static const Color _light_onSurfaceVariant = Color(0xFF534342);
  static const Color _light_outline = Color(0xFF857372);
  static const Color _light_inverseOnSurface = Color(0xFFfbeeed);
  static const Color _light_inverseSurface = Color(0xFF362f2e);

  static const Color _dark_primary = Color(0xFFffb3b1);
  static const Color _dark_onPrimary = Color(0xFF69000e);
  static const Color _dark_primaryContainer = Color(0xFF930018);
  static const Color _dark_onPrimaryContainer = Color(0xFFffdad6);
  static const Color _dark_secondary = Color(0xFF4fdbd1);
  static const Color _dark_onSecondary = Color(0xFF003733);
  static const Color _dark_secondaryContainer = Color(0xFF00504b);
  static const Color _dark_onSecondaryContainer = Color(0xFF71f7ed);
  static const Color _dark_tertiary = Color(0xFFe3c28c);
  static const Color _dark_onTertiary = Color(0xFF412d05);
  static const Color _dark_tertiaryContainer = Color(0xFF5a4319);
  static const Color _dark_onTertiaryContainer = Color(0xFFffdea7);
  static const Color _dark_error = Color(0xFFffb4a9);
  static const Color _dark_errorContainer = Color(0xFF930006);
  static const Color _dark_onError = Color(0xFF680003);
  static const Color _dark_onErrorContainer = Color(0xFFffdad4);
  static const Color _dark_background = Color(0xFF201a1a);
  static const Color _dark_onBackground = Color(0xFFecdfde);
  static const Color _dark_surface = Color(0xFF201a1a);
  static const Color _dark_onSurface = Color(0xFFecdfde);
  static const Color _dark_surfaceVariant = Color(0xFF534342);
  static const Color _dark_onSurfaceVariant = Color(0xFFd7c1c0);
  static const Color _dark_outline = Color(0xFF9f8c8b);
  static const Color _dark_inverseOnSurface = Color(0xFF201a1a);
  static const Color _dark_inverseSurface = Color(0xFFecdfde);

  static const Color _seed = Color(0xFFe83d46);
  static const Color _error = Color(0xFFba1b1b);
}

/// Contains customized Theme
class AppTheme {
  static final ThemeData mainTheme = ThemeData(
    textTheme: _textTheme,
    colorScheme: const ColorScheme.light(
      primary: MaterialYouColors._dark_background,
      primaryVariant: MaterialYouColors._light_primaryContainer,
      onPrimary: MaterialYouColors._light_onPrimary,
      secondary: MaterialYouColors._light_secondary,
      secondaryVariant: MaterialYouColors._light_secondaryContainer,
      onSecondary: MaterialYouColors._light_onSecondary,
      background: MaterialYouColors._light_background,
      onBackground: MaterialYouColors._light_onBackground,
      surface: MaterialYouColors._light_surface,
      onSurface: MaterialYouColors._light_onSurface,
      error: MaterialYouColors._light_error,
      onError: MaterialYouColors._light_onError,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: MaterialYouColors._light_onSurface),
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
                    side: const BorderSide(
                        color: MaterialYouColors._light_primary))))),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: _textTheme,
    colorScheme: const ColorScheme.dark(
      primary: MaterialYouColors._dark_primary,
      primaryVariant: MaterialYouColors._dark_primaryContainer,
      onPrimary: MaterialYouColors._dark_onPrimary,
      secondary: MaterialYouColors._dark_secondary,
      secondaryVariant: MaterialYouColors._dark_secondaryContainer,
      onSecondary: MaterialYouColors._dark_onSecondary,
      background: MaterialYouColors._dark_background,
      onBackground: MaterialYouColors._dark_onBackground,
      surface: MaterialYouColors._dark_surface,
      onSurface: MaterialYouColors._dark_onSurface,
      error: MaterialYouColors._dark_error,
      onError: MaterialYouColors._dark_onError,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: MaterialYouColors._dark_onSurface),
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
                    side: const BorderSide(color: MaterialYouColors._dark_primary))))),
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
