import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:zr_jin_page/utilities/author_name.dart';

import 'home.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const MyHomePage(titleEn: AUTHOR_TEXT, titleZh: "金增锐")),
      title: AUTHOR_TEXT,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false);
}
