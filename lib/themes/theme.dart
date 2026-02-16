import 'package:flutter/material.dart';

class AppColor {
  static Color splashTextColor = Colors.white;
  static Color splashPragraphColor = Color.fromRGBO(196, 196, 196, 100);
  static Color primaryColor = Colors.white;
  static Color secondaryColor = Colors.black;
  static Color unActiveColor = Color.fromRGBO(229, 299, 299, 100);
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.secondaryColor),
  scaffoldBackgroundColor: AppColor.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    foregroundColor: AppColor.secondaryColor,
    surfaceTintColor: AppColor.primaryColor,
  ),
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
