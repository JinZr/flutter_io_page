import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/update_card.dart';
import 'home_components/pub_card.dart';
import 'home_components/contrib_card.dart';
// import 'home_components/polaroid_card.dart';

import 'full_pub_view.dart';

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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (MediaQuery.of(context).size.width <
          MediaQuery.of(context).size.height) {
        return MobileLayout(titleEn: widget.titleEn, titleZh: widget.titleZh);
      } else {
        return DesktopLayout(titleEn: widget.titleEn, titleZh: widget.titleZh);
      }
    });
  }
}

class MobileLayout extends StatelessWidget {
  final String titleEn;
  final String titleZh;
  final _panel = Center(
      child: ListView(children: [
    const IntroductionCard(),
    const ContribCard(),
    const UpdateCard(),
    PublicationCard(),
    // const PolaroidCard()
  ]));

  MobileLayout({super.key, required this.titleEn, required this.titleZh});

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text(titleEn),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.library_books))
              ])),
          body: TabBarView(children: [
            _panel,
            FullPublicationView(),
            // const DatasetView(title: "Datasets"),
          ])));
}

class DesktopLayout extends StatefulWidget {
  final String titleEn;
  final String titleZh;

  const DesktopLayout(
      {super.key, required this.titleEn, required this.titleZh});

  @override
  State<StatefulWidget> createState() => DesktopLayoutState();
}

class DesktopLayoutState extends State<DesktopLayout> {
  int _selectedIndex = 0;
  final _body = [
    Center(
        child: ListView(children: [
      const IntroductionCard(),
      const ContribCard(),
      const UpdateCard(),
      PublicationCard(),
      // const PolaroidCard()
    ])),
    FullPublicationView(),
    // const DatasetView(title: "Datasets"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.titleEn)),
        body: Row(children: [
          NavigationRail(
              extended: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Homepage')),
                NavigationRailDestination(
                    icon: Icon(Icons.library_books_outlined),
                    selectedIcon: Icon(Icons.library_books),
                    label: Text('Publications')),
              ]),
          Expanded(
              child: PageTransitionSwitcher(
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      FadeThroughTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          child: child),
                  child: _body[_selectedIndex]))
        ]));
  }
}
