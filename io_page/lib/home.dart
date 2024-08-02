import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/update_card.dart';
import 'home_components/contrib_card.dart';
import 'home_components/polaroid_card.dart';
import 'utilities/author_name.dart';
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
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                      SliverAppBar(
                          floating: true,
                          pinned: true,
                          expandedHeight: 300.0,
                          scrolledUnderElevation: 4.0,
                          shadowColor: Theme.of(context).colorScheme.shadow,
                          flexibleSpace: FlexibleSpaceBar(
                              title: Text(AUTHOR_TEXT,
                                  style: GoogleFonts.notoSerifDisplay(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold))),
                              background: Image.asset(
                                  "assets/images/avatar/avatar.jpeg",
                                  fit: BoxFit.cover)))
                    ],
            body: ListView(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    width: screenWidth,
                    child: const IntroductionCard())
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    width: screenWidth,
                    child: const ContribCard())
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    width: screenWidth,
                    child: const UpdateCard())
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    width: screenWidth,
                    child: const PolaroidCard())
              ])
            ])));
  }
}
