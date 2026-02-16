import 'package:dooit/screens/home/home_screen.dart';
import 'package:dooit/screens/splash/splash.dart';
import 'package:dooit/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: primaryTheme,
    home: HomeScreen(),
  ));
}
