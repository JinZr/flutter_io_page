import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/author_name.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

import 'home.dart';
import 'utilities/url_strategy.dart';

void main() {
  configureUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto Serif");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      home: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: const MyHomePage(titleEn: AUTHOR_TEXT, titleZh: "金增锐"),
      ),
      title: AUTHOR_TEXT,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
