import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:zr_jin_page/utilities/author_name.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

import 'splash/splash_to_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

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
      home: const SplashToHome(),
      title: AUTHOR_TEXT,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
