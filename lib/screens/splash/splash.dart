import 'package:dooit/themes/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          color: Colors.black,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: SizedBox()),
                Image.asset("assets/img/splash.png"),
                SizedBox(height: 28),
                StyleSplashTitle("Dooit"),
                SizedBox(height: 28),
                StyleSplashPragraph("Write what you need to do. Everyday."),
                Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
