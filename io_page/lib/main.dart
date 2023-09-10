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
  Widget build(BuildContext context) => MaterialApp(
        home: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: const MyHomePage(
              titleEn: "Zengrui Jin",
              titleZh: "金增锐",
            )),
        title: 'Zengrui Jin',
        theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: null),
        darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: null),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      );
}
