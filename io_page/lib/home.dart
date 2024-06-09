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
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 300.0,
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).colorScheme.shadow,
          flexibleSpace: FlexibleSpaceBar(
              title: Text(AUTHOR_TEXT,
                  style: GoogleFonts.notoSerifDisplay(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold))),
              background: Image.network(
                  "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/avatar/avatar.jpeg",
                  fit: BoxFit.cover))),
      SliverList(
          delegate: SliverChildListDelegate(const <Widget>[
        IntroductionCard(),
        ContribCard(),
        UpdateCard(),
        PolaroidCard(),
      ]))
    ]);
  }
}
