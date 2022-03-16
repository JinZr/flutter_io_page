import 'package:flutter/material.dart';

import 'dart:convert' show json;
import 'package:url_launcher/url_launcher.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({Key? key, this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text("[${json["date"]}]: ${json["content"]}"));
  }
}
