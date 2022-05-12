import 'package:flutter/material.dart';

final chipColors = {
  "INTERSPEECH": Colors.orange.shade500,
  "TASLP": Colors.green.shade500,
  "ICASSP": Colors.indigo.shade500,
};

TextStyle chipTextStyle(String publisher) {
  if (chipColors.containsKey(publisher)) {
    return TextStyle(
      color: chipColors[publisher],
      fontWeight: FontWeight.bold,
    );
  } else {
    return TextStyle(
      color: Colors.yellow.shade500,
      fontWeight: FontWeight.bold,
    );
  }
}

Color chipColor(String publisher) {
  if (chipColors.containsKey(publisher)) {
    return chipColors[publisher]!;
  } else {
    return Colors.purple.shade500;
  }
}
