import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/selected_pub_card.dart';
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
      appBar: AppBar(
        title: Text(
          widget.titleEn,
          style: GoogleFonts.notoSerifDisplay(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        scrolledUnderElevation: 4.0,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ListView(
            children: const [
              IntroductionCard(),
              ContribCard(),
              SelectedPubCard(),
              PolaroidCard(),
            ],
          ),
        ),
      ),
    );
  }
}
