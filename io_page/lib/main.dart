import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'home.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
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
      title: 'Zengrui JIN',
      theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.light,
          colorSchemeSeed: null),
      darkTheme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          colorSchemeSeed: null),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
