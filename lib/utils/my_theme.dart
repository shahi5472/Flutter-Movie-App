import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightWhiteColor,
    colorScheme: const ColorScheme.light(secondary: lightWhiteColor),
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      titleTextStyle: GoogleFonts.poppins(color: textColor),
      elevation: 0,
      actionsIconTheme: const IconThemeData(color: textColor, size: 18.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: lightBlueColor,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: GoogleFonts.poppins(color: textColor.withOpacity(0.3)),
      suffixIconColor: textColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      fillColor: searchFillColor,
      filled: true,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: lightBlueColor,
    ),
  );
}
