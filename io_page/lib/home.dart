import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:zr_jin_page/dataset_view.dart';

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
  int _selectedDestination = 0;

  final _gridViewTiles = [
    const StaggeredGridTile.fit(
      crossAxisCellCount: 2,
      child: IntroductionCard(),
    ),
    const StaggeredGridTile.fit(
      crossAxisCellCount: 2,
      child: UpdateCard(),
    ),
    const StaggeredGridTile.fit(
      crossAxisCellCount: 4,
      child: PublicationCard(),
    ),
    const StaggeredGridTile.fit(
      crossAxisCellCount: 2,
      child: PolaroidCard(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    bool extended =
        screenSize.height < screenSize.width - 500 && screenSize.width > 900;
    bool notUseDrawer =
        screenSize.height < screenSize.width + 200 && screenSize.width > 700;

    final bodyWithDrawer = <Widget>[
      _buildGridViewPanel(notUseDrawer),
      const FullPublicationView(title: "Publications"),
      const PolaroidGalleryView(title: "Polaroid Cameras"),
      // const DatasetView(title: "Datasets"),
    ];

    return Scaffold(
        appBar: AppBar(title: Text(widget.titleEn)),
        // drawer: notUseDrawer ? null : _buildDrawer(context),
        bottomNavigationBar: notUseDrawer ? null : _bottomNaviBar(),
        body: notUseDrawer
            ? Row(children: [
                _rail(extended),
                Expanded(
                    child: Center(
                  child: PageTransitionSwitcher(
                    transitionBuilder: (child, animation, secondaryAnimation) =>
                        FadeThroughTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                    ),
                    child: bodyWithDrawer[_selectedDestination],
                  ),
                )),
              ])
            : Expanded(
                child: Center(
                child: PageTransitionSwitcher(
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  ),
                  child: bodyWithDrawer[_selectedDestination],
                ),
              )));
  }

  NavigationBar _bottomNaviBar() => NavigationBar(
        selectedIndex: _selectedDestination,
        onDestinationSelected: (int index) {
          _selectDestinationRail(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.library_books), label: "Publications"),
          NavigationDestination(
              icon: Icon(Icons.camera_alt_sharp), label: "Polaroid Cameras"),
        ],
      );

  NavigationRail _rail(bool extended) => NavigationRail(
        destinations: const [
          NavigationRailDestination(
              icon: Icon(Icons.home), label: Text("Home")),
          NavigationRailDestination(
              icon: Icon(Icons.library_books), label: Text("Publications")),
          NavigationRailDestination(
              icon: Icon(Icons.camera_alt_sharp),
              label: Text("Polaroid Cameras")),
        ],
        selectedIndex: _selectedDestination,
        extended: extended,
        labelType: extended ? null : NavigationRailLabelType.all,
        onDestinationSelected: (int index) {
          _selectDestinationRail(index);
        },
      );

  void _selectDestinationRail(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  Widget _buildGridViewPanel(bool notUseDrawer) => SingleChildScrollView(
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: StaggeredGrid.count(
            crossAxisCount: notUseDrawer ? 4 : 1,
            children: _gridViewTiles,
          )));
}
