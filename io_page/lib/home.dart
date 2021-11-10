import 'package:flutter/material.dart';

import 'components/self_intro.dart';
import 'components/update_list.dart';
import 'components/pub_list.dart';
import 'components/polaroid_gallery_view.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<Widget> _children = [
    Introduction(),
    UpdateList(),
    PublicationList(),
    PolaroidGalleryView(),
  ];
  final List<StaggeredTile> _tiles = [
    StaggeredTile.count(1, 1.1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        //     child: ListView(
        //   children: [
        //     screenSize.height < screenSize.width - 100
        //         ? _buildWidgetForWideScreen()
        //         : _buildWidgetForLongScreen(),
        //   ],
        // )
        child: StaggeredGridView.count(
          crossAxisCount: 3,
          children: widget._children,
          staggeredTiles: widget._tiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }

  Widget _buildWidgetForWideScreen() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(children: [
              Introduction(),
              PolaroidGalleryView(),
            ]),
          ),
          Expanded(
              flex: 3,
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
