import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle clickableTextStyle(Color primary, double fontSize) =>
    GoogleFonts.notoSerifDisplay(
        textStyle: TextStyle(
            color: primary, fontWeight: FontWeight.bold, fontSize: fontSize));
