import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/update_card.dart';
import 'home_components/pub_card.dart';
import 'home_components/polaroid_card.dart';

import 'full_pub_view.dart';
// import 'polaroid_gallery_view.dart';

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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (MediaQuery.of(context).size.width <
            MediaQuery.of(context).size.height) {
          return MobileLayout(
            titleEn: widget.titleEn,
            titleZh: widget.titleZh,
          );
        } else {
          return DesktopLayout(
            titleEn: widget.titleEn,
            titleZh: widget.titleZh,
          );
        }
      },
    );
  }
}

class MobileLayout extends StatelessWidget {
  final String titleEn;
  final String titleZh;
  final _panel = Center(
    child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: ListView(
          children: const [
            IntroductionCard(),
            UpdateCard(),
            PublicationCard(),
            PolaroidCard()
          ],
        )),
  );

  MobileLayout({Key? key, required this.titleEn, required this.titleZh})
      : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(titleEn),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.library_books)),
              // Tab(icon: Icon(Icons.camera_alt_sharp))
            ]),
          ),
          body: TabBarView(children: [
            _panel,
            const FullPublicationView(title: "Publications"),
            // const PolaroidGalleryView(title: "Polaroid Cameras"),
            // const DatasetView(title: "Datasets"),
          ])));
}

class DesktopLayout extends StatefulWidget {
  final String titleEn;
  final String titleZh;

  const DesktopLayout({Key? key, required this.titleEn, required this.titleZh})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DesktopLayoutState();
}

class DesktopLayoutState extends State<DesktopLayout> {
  int _selectedIndex = 0;
  final _body = [
    Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: ListView(
              children: const [
                IntroductionCard(),
                UpdateCard(),
                PublicationCard(),
                PolaroidCard()
              ],
            ))),
    const FullPublicationView(title: "Publications"),
    // const PolaroidGalleryView(title: "Polaroid Cameras"),
    // const DatasetView(title: "Datasets"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.titleEn)),
        body: Row(
          children: [
            NavigationRail(
                selectedIndex: _selectedIndex,
                labelType: NavigationRailLabelType.all,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Homepage'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.library_books),
                    label: Text('Publications'),
                  ),
                  // NavigationRailDestination(
                  //   icon: Icon(Icons.camera_alt_sharp),
                  //   label: Text('Polaroid'),
                  // ),
                ]),
            Expanded(
              child: PageTransitionSwitcher(
                transitionBuilder: (child, animation, secondaryAnimation) =>
                    FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                ),
                child: _body[_selectedIndex],
              ),
            )
          ],
        ));
  }
}
