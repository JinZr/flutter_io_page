import 'package:flutter/material.dart';

class PolaroidCard extends StatefulWidget {
  final String title;
  final String imagePath;

  const PolaroidCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PolaroidCardState();
}

class _PolaroidCardState extends State<PolaroidCard> {
  // bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Theme.of(context).colorScheme.onSurface,
      child: Card(
        child: Column(
          children: [
            SizedBox(
                height: 225,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(widget.imagePath),
                )))),
            ListTile(title: Text(widget.title)),
          ],
        ),
      ),
    );
  }
}
