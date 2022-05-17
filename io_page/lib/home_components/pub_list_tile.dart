import 'package:flutter/material.dart';

import 'author_text.dart';
import '../utilities/chip_color.dart';

class PublicationListTile extends StatefulWidget {
  final dynamic json;

  const PublicationListTile({Key? key, this.json}) : super(key: key);

  @override
  State<PublicationListTile> createState() => _PublicationListTileState();
}

class _PublicationListTileState extends State<PublicationListTile> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (screenSize.height >= screenSize.width - 100) {
      return InkWell(
        child: ListTile(
          title: Text(
            "${widget.json["title"]}",
            style: Theme.of(context).textTheme.bodyText1!,
          ),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AuthorListText(
                text: widget.json["author"],
                regularStyle: Theme.of(context).textTheme.subtitle1!,
                matchStyle: Theme.of(context).textTheme.bodyText2!),
            Chip(label: 
              Text(
                widget.json["publisher"],
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          ]),
        )
      );
    } else {
      return InkWell(
        child: ListTile(
          leading: Chip(
            label: Text(
                widget.json["publisher"], 
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
          title: Text(
            "${widget.json["title"]}",
            style: Theme.of(context).textTheme.bodyText1!,
          ),
          subtitle: 
            AuthorListText(
                text: widget.json["author"],
                regularStyle: Theme.of(context).textTheme.subtitle1!,
                matchStyle: Theme.of(context).textTheme.bodyText2!),
            
        ),
      );
    }
    
  }
}
