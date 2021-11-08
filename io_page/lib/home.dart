import 'package:flutter/material.dart';

import 'components/self_intro.dart';
import 'components/update_list.dart';
import 'components/pub_list.dart';
import 'components/polaroid_gallery_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
        // leading: const Image(image: AssetImage('images/avatar.jpeg')),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Item 1'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Item 2'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
        children: [
          screenSize.height < screenSize.width - 100
              ? _buildWidgetForWideScreen()
              : _buildWidgetForLongScreen(),
        ],
      )),
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
