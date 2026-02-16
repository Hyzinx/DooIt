import 'package:dooit/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final Function() onTap;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: !isSelected
              ? AppColor.splashPragraphColor
              : AppColor.secondaryColor,
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: !isSelected
                ? AppColor.secondaryColor.withOpacity(0.4)
                : AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
