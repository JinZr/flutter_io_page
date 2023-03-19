import 'package:flutter/material.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/update_card.dart';
import 'home_components/pub_card.dart';
import 'home_components/polaroid_card.dart';

import 'full_pub_view.dart';
import 'polaroid_gallery_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.titleEn, required this.titleZh})
      : super(key: key);

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final body = <Widget>[
      _buildGridViewPanel(),
      const FullPublicationView(title: "Publications"),
      const PolaroidGalleryView(title: "Polaroid Cameras"),
      // const DatasetView(title: "Datasets"),
    ];

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.titleEn),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.library_books)),
                Tab(icon: Icon(Icons.camera_alt_sharp))
              ]),
            ),
            body: TabBarView(
              children: body,
            )));
  }

  Widget _buildGridViewPanel() => ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: ListView(
        children: const [
          IntroductionCard(),
          UpdateCard(),
          PublicationCard(),
          PolaroidCard()
        ],
      ));
}
