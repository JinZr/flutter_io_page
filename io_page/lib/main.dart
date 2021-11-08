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
            bodyText1: TextStyle(color: Colors.black.withOpacity(0.6)),
            bodyText2: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold),
            button: TextStyle(color: Colors.blue.shade500),
          )),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white.withOpacity(.8)),
          bodyText2: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
          button: const TextStyle(color: Colors.yellow),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Zengrui JIN (金增锐)'),
      debugShowCheckedModeBanner: false,
    );
  }
}
