import 'package:flutter/material.dart';

import 'home_components/self_intro.dart';
import 'home_components/update_list.dart';
import 'home_components/pub_list.dart';
import 'home_components/polaroid_gallery_view.dart';

import 'full_pub_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration:  BoxDecoration(
                color: Colors.blue,
                // image: const DecorationImage(
                //   image: AssetImage('assets/images/avatar/avatar.jpeg'),
                //   fit: BoxFit.fitWidth,
                // ),
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.white,
                    ],
                    stops: const [0.0, 1.0]
                  )
              ),
              child: const Text("Navigation Menu")
            ),
            InkWell(
              child: ListTile(
                  leading: const Icon(Icons.library_books),
                  title: const Text("Full Publication List"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const FullPublicationView(
                              title: 'Full Publication List',
                            )));
                  }),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8), 
          child:  ListView(
            children: [
              screenSize.height < screenSize.width - 100
                  ? _buildWidgetForWideScreen()
                  : _buildWidgetForLongScreen(),
            ],
          ),
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
