import 'package:flutter/material.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({Key? key, this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
      leading: Chip(label: Text(json["date"])),
      title: Text("${json["content"]}"));
}
