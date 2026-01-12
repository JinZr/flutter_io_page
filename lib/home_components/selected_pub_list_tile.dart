import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedPubListTile extends StatelessWidget {
  final dynamic json;

  const SelectedPubListTile({super.key, this.json});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(json["title"]),
      subtitle: Text(json["author"]),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Text(json["venue"]), Text(json["year"])],
      ),
      isThreeLine: true,
      onTap: () {
        final uri = Uri.parse(json["link"]);
        launchUrl(uri);
      },
    );
  }
}
