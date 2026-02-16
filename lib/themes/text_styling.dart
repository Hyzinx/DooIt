import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleSplashTitle extends StatelessWidget {
  const StyleSplashTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class StyleSplashPragraph extends StatelessWidget {
  const StyleSplashPragraph(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
