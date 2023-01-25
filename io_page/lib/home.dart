import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zr_jin_page/dataset_view.dart';

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
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(const Duration(seconds: 3), () {
    //     ScaffoldMessenger.of(context)
    //       ..clearMaterialBanners()
    //       ..showMaterialBanner(MaterialBanner(
    //         elevation: 6.0,
    //         leading: const Icon(Icons.data_object),
    //         content: const Text(
    //             'Dataset for real world video deraining is available for download now.'),
    //         actions: [
    //           TextButton(
    //               onPressed: () =>
    //                   ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
    //               child: const Text("DISMISS")),
    //           TextButton(
    //             onPressed: () {
    //               setState(() {
    //                 _selectedDestination = 3;
    //               });
    //               ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    //             },
    //             child: const Text('DOWNLOAD'),
    //           ),
    //         ],
    //       ));
    //   });
    // });
  }

  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    bool extended =
        screenSize.height < screenSize.width - 500 && screenSize.width > 900;
    bool notUseDrawer =
        screenSize.height < screenSize.width + 200 && screenSize.width > 700;
    // bool isLandscape =
    //     MediaQuery.of(context).orientation == Orientation.landscape;

    List<Widget> bodyWithDrawer = <Widget>[
      _buildGridViewPanel(notUseDrawer),
      const FullPublicationView(title: "Publications"),
      const PolaroidGalleryView(title: "Polaroid Cameras"),
      const DatasetView(title: "Datasets"),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titleEn),
          centerTitle: false,
        ),
        // drawer: notUseDrawer ? null : _buildDrawer(context),
        bottomNavigationBar: notUseDrawer ? null : _bottomNaviBar(),
        body: Row(children: [
          if (notUseDrawer) _rail(extended),
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
        ]));
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
          // NavigationDestination(
          //     icon: const Icon(Icons.data_object),
          //     label: "Dataset"),
        ],
      );

  NavigationRail _rail(bool extended) => NavigationRail(
        destinations: [
          NavigationRailDestination(
              icon: const Icon(Icons.home),
              label:
                  Text("Home", style: Theme.of(context).textTheme.labelLarge)),
          NavigationRailDestination(
              icon: const Icon(Icons.library_books),
              label: Text("Publications",
                  style: Theme.of(context).textTheme.labelLarge)),
          NavigationRailDestination(
              icon: const Icon(Icons.camera_alt_sharp),
              label: Text("Polaroid Cameras",
                  style: Theme.of(context).textTheme.labelLarge)),
          // NavigationRailDestination(
          //     icon: const Icon(Icons.data_object),
          //     label: Text("Datasets", style: GoogleFonts.roboto())),
        ],
        selectedIndex: _selectedDestination,
        extended: extended,
        labelType: extended ? null : NavigationRailLabelType.all,
        onDestinationSelected: (int index) {
          _selectDestinationRail(index);
        },
      );

  // Drawer _buildDrawer(BuildContext context) => Drawer(
  //       child: ListView(
  //         padding: EdgeInsets.zero,
  //         children: [
  //           InkWell(
  //             child: ListTile(
  //                 leading: const Icon(Icons.home),
  //                 title: const Text("Home"),
  //                 selectedTileColor:
  //                     Theme.of(context).colorScheme.secondaryContainer,
  //                 selectedColor:
  //                     Theme.of(context).colorScheme.onSecondaryContainer,
  //                 selected: _selectedDestination == 0,
  //                 onTap: () => _selectDestinationDrawer(0)),
  //           ),
  //           InkWell(
  //             child: ListTile(
  //                 leading: const Icon(Icons.library_books),
  //                 title: const Text("Publications"),
  //                 selectedTileColor:
  //                     Theme.of(context).colorScheme.secondaryContainer,
  //                 selectedColor:
  //                     Theme.of(context).colorScheme.onSecondaryContainer,
  //                 selected: _selectedDestination == 1,
  //                 onTap: () => _selectDestinationDrawer(1)),
  //           ),
  //           InkWell(
  //             child: ListTile(
  //                 leading: const Icon(Icons.camera_alt_sharp),
  //                 title: const Text("Polaroid Cameras"),
  //                 selectedTileColor:
  //                     Theme.of(context).colorScheme.secondaryContainer,
  //                 selectedColor:
  //                     Theme.of(context).colorScheme.onSecondaryContainer,
  //                 selected: _selectedDestination == 2,
  //                 onTap: () => _selectDestinationDrawer(2)),
  //           ),
  //           // InkWell(
  //           //   child: ListTile(
  //           //       leading: const Icon(Icons.data_object),
  //           //       title: const Text("Datasets"),
  //           //       selectedTileColor:
  //           //           Theme.of(context).colorScheme.secondaryContainer,
  //           //       selectedColor:
  //           //           Theme.of(context).colorScheme.onSecondaryContainer,
  //           //       selected: _selectedDestination == 3,
  //           //       onTap: () => _selectDestinationDrawer(3)),
  //           // ),
  //         ],
  //       ),
  //     );

  // void _selectDestinationDrawer(int index) {
  //   setState(() {
  //     _selectedDestination = index;
  //   });
  //   Navigator.pop(context);
  // }

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
            children: [
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
              StaggeredGridTile.fit(
                  crossAxisCellCount: 4,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 50),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          showAboutDialog(context: context);
                        },
                        child: const Text("POWERED BY FLUTTER"),
                      ),
                    ),
                  )),
            ],
          )));
}
