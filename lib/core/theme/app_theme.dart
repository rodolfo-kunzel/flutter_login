import 'package:flutter/material.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: kLightSwatch,
      brightness: Brightness.light,
      focusColor: kLightFocusColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kLightScaffoldBackgroundColor,
      dialogBackgroundColor: kLightDialogBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: kLightAppBarThemeColor,
        elevation: 0,
        iconTheme: IconThemeData(color: kLightAppIconColor),
        titleTextStyle: TextStyle(
          color: kLightTitleTextColor,
          fontSize: 36,
          fontWeight: FontWeight.normal,
        ),
      ),
      iconTheme: const IconThemeData(
        color: kLightAppIconColor,
      ),
      textTheme: GoogleFonts.syneTextTheme(
        const TextTheme(
          displaySmall: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(
              color: kLightFocusText,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          labelMedium: TextStyle(
              color: kLightFocusText,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline),
          displayMedium: TextStyle(
              color: klightHeadlineTextColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          titleLarge: TextStyle(
              color: kLightTitleTextColor,
              fontSize: 36,
              fontWeight: FontWeight.normal),
          titleMedium: TextStyle(
              color: kLightTitleTextColor,
              fontSize: 24,
              fontWeight: FontWeight.normal),    
          headlineLarge: TextStyle(
              color: klightHeadlineTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: klightHeadlineTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: klightBodyTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: kDarkSwatch,
      brightness: Brightness.dark,
      focusColor: kDarkFocusColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kDarkScaffoldBackgroundColor,
      dialogBackgroundColor: kDarkDialogBackgroundColor,
      appBarTheme: AppBarTheme(
        color: Colors.grey[900],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: kDarkAppIconColor,
      ),
      textTheme: GoogleFonts.syneTextTheme(
        const TextTheme(
          displaySmall: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(
              color: kDarkFocusText,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          labelMedium: TextStyle(
              color: kDarkFocusText,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline),
          displayMedium: TextStyle(
              color: klightDisplayMediumColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          titleLarge: TextStyle(
              color: kDarkTitleTextColor,
              fontSize: 36,
              fontWeight: FontWeight.normal),
          titleMedium: TextStyle(
              color: kDarkTitleTextColor,
              fontSize: 24,
              fontWeight: FontWeight.normal),
          headlineLarge: TextStyle(
              color: kDarkHeadlineTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: kDarkHeadlineTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
         headlineMedium: TextStyle(
              color: kDarkBodyTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
