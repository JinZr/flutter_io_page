import 'package:flutter/material.dart';

class PolaroidCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const PolaroidCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Stack(children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagePath)),
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
                        Colors.black,
                      ],
                      stops: const [
                        0.0,
                        1.0
                      ])),
            ),
          ]),
          ListTile(
            title: Text(title),
          )
        ]));
  }
}
