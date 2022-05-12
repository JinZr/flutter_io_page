import 'package:flutter/material.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({Key? key, this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Chip(
        label: Text(
          json["date"],
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      title: Text(
        "${json["content"]}",
      )
    );
  }
}
