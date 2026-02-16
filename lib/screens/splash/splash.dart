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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/splash.png"),
                SizedBox(height: 40),
                Text(
                  "Dooit",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
