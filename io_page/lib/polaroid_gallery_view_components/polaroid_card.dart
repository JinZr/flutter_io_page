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
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath)),
            ),
          ),
          ListTile(
            title: Text(title),
          )
        ]));
  }
}
