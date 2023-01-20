import 'package:breeze_case/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreezeTheme {
  /// Returns the theme of the app.
  static ThemeData themeData = ThemeData(
      primaryColor: kDarkBlue,
      backgroundColor: kWhiteColor,
      iconTheme: const IconThemeData(color: kDarkBlue),
      primaryIconTheme: const IconThemeData(color: kDarkBlue),
      appBarTheme: const AppBarTheme(
          backgroundColor: kWhiteColor,
          foregroundColor: kDarkBlue,
          actionsIconTheme: IconThemeData(color: kDarkBlue),
          elevation: 0,
          iconTheme: IconThemeData(color: kDarkBlue)),
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
      dialogTheme: DialogTheme(
          titleTextStyle: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700, color: kPinkColor),
          contentTextStyle: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400, color: kDarkBlue),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: kPinkColor,
              textStyle: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w700, color: kPinkColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      fontFamily: GoogleFonts.dmSans().fontFamily);
}
