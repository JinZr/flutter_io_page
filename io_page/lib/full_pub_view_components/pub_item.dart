import 'package:flutter/material.dart';
import 'dart:convert' show json;

// stores ExpansionPanel state information
class PublicationItem {
  PublicationItem({
    required this.json,
    this.isExpanded = false,
  }) {
    this.title = json["title"];
  }

  dynamic json;
  bool isExpanded;

  late String title;
  // String author_list;
}

List<PublicationItem> generateItems(List<dynamic> json) {
  return List<PublicationItem>.generate(json.length, (int index) {
    return PublicationItem(json: json[index]);
  });
}
