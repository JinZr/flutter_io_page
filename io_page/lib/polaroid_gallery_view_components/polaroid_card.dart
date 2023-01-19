import 'dart:ui';

import 'package:flutter/material.dart';

class PolaroidCard extends StatefulWidget {
  final String title;
  final String imagePath;

  const PolaroidCard({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  State<PolaroidCard> createState() => _PolaroidCardState();
}

class _PolaroidCardState extends State<PolaroidCard> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onHover: (value) {
            setState(() {
              onHover = value;
            });
          },
          onTap: () {},
          hoverColor: Theme.of(context).colorScheme.onSurface,
          child: Card(
            elevation: onHover ? 2 : 1,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 225,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(widget.imagePath),
                      ),
                    ),
                  ),
                  ListTile(title: Text(widget.title))
                ]),
          ),
        ));
  }
}
