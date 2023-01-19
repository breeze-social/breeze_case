import 'package:breeze_case/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreezeTheme {
  /// Returns the theme of the app.
  static ThemeData themeData = ThemeData(
      primaryColor: kDarkBlue,
      backgroundColor: kWhiteColor,
      appBarTheme: const AppBarTheme(color: kWhiteColor, elevation: 0),
      scaffoldBackgroundColor: kWhiteColor,
      cardTheme: CardTheme(
          color: kWhiteColor,
          elevation: 0,
          shadowColor: kGreyColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      textTheme: TextTheme(
          headline1: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w700, color: kDarkBlue),
          headline2: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700, color: kDarkBlue),
          headline3: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w500, color: kDarkBlue),
          headline4: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w500, color: kDarkBlue),
          headline5: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w500, color: kDarkBlue),
          headline6: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500, color: kDarkBlue),
          bodyText1: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w400, color: kDarkBlue),
          bodyText2: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w400, color: kDarkBlue),
          subtitle1: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w400, color: kDarkBlue),
          subtitle2: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400, color: kDarkBlue),
          caption: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w400, color: kDarkBlue),
          button: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w400, color: kDarkBlue),
          overline: GoogleFonts.dmSans(fontSize: 10, fontWeight: FontWeight.w400, color: kDarkBlue)),
      cardColor: kWhiteColor,
      fontFamily: GoogleFonts.dmSans().fontFamily);
}
