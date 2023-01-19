import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle clickableTextStyle(bool isLightMode, Color primary, double fontSize) {
  if (!isLightMode) {
    return GoogleFonts.roboto(
      color: primary,
      fontWeight: FontWeight.bold,
      fontSize: fontSize
    );
  } else {
    return GoogleFonts.roboto(
      color: primary,
      fontWeight: FontWeight.bold,
    );
  }
}
