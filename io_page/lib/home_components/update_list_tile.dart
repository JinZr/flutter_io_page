import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/custom_chip.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({Key? key, this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
      leading: CustomChip(str: json["date"]),
      title: Text("${json["content"]}"));
}
