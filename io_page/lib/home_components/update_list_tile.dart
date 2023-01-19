import 'package:flutter/material.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({Key? key, this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: RawChip(
          label: Text(
            json["date"],
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.labelLarge!.fontSize!),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        title: SelectableText(
          "${json["content"]}",
        ));
  }
}
