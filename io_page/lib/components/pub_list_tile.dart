import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class PublicationListTile extends StatefulWidget {
  final dynamic json;

  const PublicationListTile({Key? key, this.json}) : super(key: key);

  @override
  State<PublicationListTile> createState() => _PublicationListTileState();
}

class _PublicationListTileState extends State<PublicationListTile> {
  @override
  Widget build(BuildContext context) => ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.open_in_browser),
          onPressed: () => _launchURL(widget.json["link"]),
        ),
        title: SelectableText(
          "[${widget.json["publisher"]}] ${widget.json["title"]}",
        ),
        subtitle: SelectableText(
          widget.json["author"],
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
      );

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
