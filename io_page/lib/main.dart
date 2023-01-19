import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:animations/animations.dart';

import 'home.dart';
import 'theme/purple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(
        titleEn: "Zengrui JIN",
        titleZh: "金增锐",
      ),
      title: 'Zengrui JIN (金增锐)',
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
