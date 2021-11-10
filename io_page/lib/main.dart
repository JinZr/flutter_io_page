import 'package:flutter/material.dart';

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
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline6: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
            bodyText1: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
            bodyText2: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.25,
              decoration: TextDecoration.underline,
            ),
            button: TextStyle(
                color: Colors.blue.shade500,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 0.4),
          )),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          headline6: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          bodyText1: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          bodyText2: TextStyle(
            color: Colors.white.withOpacity(.6),
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.25,
            decoration: TextDecoration.underline,
          ),
          button: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: 0.4),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Zengrui JIN (金增锐)'),
      debugShowCheckedModeBanner: false,
    );
  }
}
