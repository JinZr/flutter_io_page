import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_components/self_intro_card.dart';
import 'home_components/update_card.dart';
import 'home_components/pub_card.dart';
import 'home_components/polaroid_card.dart';

import 'full_pub_view.dart';
import 'polaroid_gallery_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {Key? key,
      required this.titleEn,
      required this.titleZh})
      : super(key: key);

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    bool extended =
        screenSize.height < screenSize.width - 500 && screenSize.width > 900;
    bool notUseDrawer =
        screenSize.height < screenSize.width + 200 && screenSize.width > 700;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    List<Widget> _bodyWithDrawer = <Widget>[
      _buildGridViewPanel(notUseDrawer),
      const FullPublicationView(title: "Publications"),
      const PolaroidGalleryView(title: "Polaroid Cameras"),
    ];

    return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text(widget.titleEn),
                ),
                drawer: notUseDrawer ? null : _buildDrawer(context),
                body: Row(children: [
                  if (notUseDrawer) _rail(extended),
                  Expanded(
                      child: Center(
                    child: _bodyWithDrawer[_selectedDestination],
                  )),
                ]))));
  }

  NavigationRail _rail(bool extended) => NavigationRail(
        destinations: [
          NavigationRailDestination(
              icon: const Icon(Icons.home),
              label: Text("Home", style: GoogleFonts.roboto())),
          NavigationRailDestination(
              icon: const Icon(Icons.library_books),
              label: Text("Publications", style: GoogleFonts.roboto())),
          NavigationRailDestination(
              icon: const Icon(Icons.camera_alt_sharp),
              label: Text("Polaroid Cameras", style: GoogleFonts.roboto())),
        ],
        selectedIndex: _selectedDestination,
        extended: extended,
        labelType: extended ? null : NavigationRailLabelType.all,
        onDestinationSelected: (int index) {
          _selectDestinationRail(index);
        },
      );

  Drawer _buildDrawer(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            InkWell(
              child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedTileColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  selectedColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  selected: _selectedDestination == 0,
                  onTap: () => _selectDestinationDrawer(0)),
            ),
            InkWell(
              child: ListTile(
                  leading: const Icon(Icons.library_books),
                  title: const Text("Publications"),
                  selectedTileColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  selectedColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  selected: _selectedDestination == 1,
                  onTap: () => _selectDestinationDrawer(1)),
            ),
            InkWell(
              child: ListTile(
                  leading: const Icon(Icons.camera_alt_sharp),
                  title: const Text("Polaroid Cameras"),
                  selectedTileColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  selectedColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  selected: _selectedDestination == 1,
                  onTap: () => _selectDestinationDrawer(1)),
            ),
          ],
        ),
      );

  void _selectDestinationDrawer(int index) {
    setState(() {
      _selectedDestination = index;
    });
    Navigator.pop(context);
  }

  void _selectDestinationRail(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  Widget _buildGridViewPanel(bool notUseDrawer) => SingleChildScrollView(
          child: StaggeredGrid.count(
        crossAxisCount: notUseDrawer ? 4 : 1,
        children: const [
          StaggeredGridTile.fit(
            crossAxisCellCount: 2,
            child: IntroductionCard(),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 2,
            child: UpdateCard(),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 4,
            child: PublicationCard(),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 2,
            child: PolaroidCard(),
          ),
        ],
      ));
}
