import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static Color splashTextColor = Colors.white;
  static Color splashPragraphColor = Color.fromRGBO(196, 196, 196, 100);
}

ThemeData primaryTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: AppColor.splashTextColor,
      fontSize: 39.08,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: AppColor.splashPragraphColor,
      fontSize: 18.98,
      fontWeight: FontWeight.bold,
    ),
  ),
);
