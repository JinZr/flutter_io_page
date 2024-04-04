import 'package:flutter/material.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/update_card.dart';
import 'home_components/contrib_card.dart';
import 'home_components/polaroid_card.dart';

// import 'full_pub_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.titleEn, required this.titleZh});

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: ListView(children: const [
                  IntroductionCard(),
                  ContribCard(),
                  UpdateCard(),
                  PolaroidCard(),
                ]))));
  }
}
