import 'package:flutter/material.dart';

TextStyle clickableTextStyle(TextTheme textTheme, Color primary) =>
    textTheme.bodyMedium!.copyWith(color: primary, decoration: .underline);
