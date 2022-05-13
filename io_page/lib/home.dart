import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_components/self_intro.dart';
import 'home_components/update_list.dart';
import 'home_components/pub_list.dart';
import 'home_components/polaroid_gallery_view.dart';

import 'full_pub_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title_en, required this.title_zh})
      : super(key: key);

  final String title_en;
  final String title_zh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              widget.title_en,
              style: GoogleFonts.roboto(),
            ),
            const Text("\t"),
            Text(
              widget.title_zh,
              style: GoogleFonts.longCang(),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(children: [_buildGridViewPanel(screenSize)]),
        ),
      ),
    );
  }

  ListView _buildListViewPanel(Size screenSize) {
    return ListView(
      children: [
        screenSize.height < screenSize.width - 100
            ? _buildWidgetForWideScreen()
            : _buildWidgetForLongScreen(),
      ],
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Stack(children: <Widget>[
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/bg.jpeg')),
                ),
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.white,
                        ],
                        stops: const [
                          0.0,
                          1.0
                        ])),
              ),
            ]),
          ),
          InkWell(
            child: ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Publication"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FullPublicationView(
                            title: 'Publication',
                          )));
                }),
          )
        ],
      ),
    );
  }

  Widget _buildGridViewPanel(Size screenSize) {
    return StaggeredGrid.count(
      crossAxisCount: screenSize.height < screenSize.width - 100 ? 2 : 1,
      children: [
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: Introduction(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: UpdateList(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 2,
          child: PublicationList(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: PolaroidGalleryView(),
        ),
      ],
    );

    // GridView(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: screenSize.height < screenSize.width - 100 ? 2 : 1,
    //     childAspectRatio: 1
    //   ),
    //   physics: const BouncingScrollPhysics(),
    //   children: [
    //     Introduction(),
    //     UpdateList(),
    //     PublicationList(),
    //     PolaroidGalleryView(),
    //   ],
    // );
  }

  Widget _buildWidgetForWideScreen() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(children: [
              Introduction(),
              PolaroidGalleryView(),
            ]),
          ),
          Expanded(
              flex: 5,
              child: Column(
                children: [UpdateList(), PublicationList()],
              ))
        ],
      );

  Widget _buildWidgetForLongScreen() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Introduction(),
          UpdateList(),
          PublicationList(),
          PolaroidGalleryView(),
        ],
      );
}
