import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zengrui JIN (金增锐)',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headline5: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          headline6: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: GoogleFonts.roboto(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: GoogleFonts.longCang(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyText1: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: GoogleFonts.roboto(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
          caption: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          button: GoogleFonts.roboto(
            color: Colors.blue.shade500,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        )
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          headline1: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headline5: GoogleFonts.roboto(
            color: Colors.white.withOpacity(.8),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          headline6: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: GoogleFonts.roboto(
            color: Colors.white.withOpacity(.8),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: GoogleFonts.longCang(
            color: Colors.white.withOpacity(.8),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyText1: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: GoogleFonts.roboto(
            color: Colors.white.withOpacity(.6),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
          caption: GoogleFonts.roboto(
            color: Colors.white.withOpacity(.6),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          button: GoogleFonts.roboto(
            color: Colors.yellow,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(
        title_en: 'Zengrui JIN',
        title_zh: '金增锐',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
