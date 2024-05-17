import 'package:flutter/material.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({super.key, this.json});

  @override
  Widget build(BuildContext context) => ListTile(
      leading: Chip(label: Text(json["date"])),
      title: Text("${json["content"]}"));
}
