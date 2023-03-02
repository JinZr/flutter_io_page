import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle regularTextStyle(bool isLightMode, double fontSize) {
  if (!isLightMode) {
    return GoogleFonts.roboto(
      color: Colors.white.withOpacity(0.8),
      fontSize: fontSize,
    );
  } else {
    return GoogleFonts.roboto(
      color: Colors.black.withOpacity(0.8),
      fontSize: fontSize,
    );
  }
}

TextStyle matchTextStyle(
    BuildContext context, bool isLightMode, double fontSize) {
  if (!isLightMode) {
    return GoogleFonts.roboto(
      // color: Colors.white.withOpacity(0.8),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
  } else {
    return GoogleFonts.roboto(
      // color: Colors.black.withOpacity(0.8),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
  }
}
