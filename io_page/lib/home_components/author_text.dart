import 'package:flutter/material.dart';

import '../author_name.dart';

class AuthorListText extends StatelessWidget {
  final String text;
  final TextStyle regularStyle;
  final TextStyle matchStyle;

  const AuthorListText(
      {Key? key,
      required this.text,
      required this.regularStyle,
      required this.matchStyle})
      : super(key: key);

  TextSpan _buildText(String s) {
    List<InlineSpan> children = [];
    List<String> authorList = s.split(RegExp(', '));
    List<String> lowerCaseAuthorList =
        authorList.map((e) => e.toLowerCase()).toList();
    String lowerCaseAuthorText = AUTHOR_TEXT.toLowerCase();
    for (var author in lowerCaseAuthorList) {
      if (author == lowerCaseAuthorText) {
        children.add(TextSpan(text: AUTHOR_TEXT, style: matchStyle));
      } else {
        children.add(TextSpan(
            text: authorList[lowerCaseAuthorList.indexOf(author)],
            style: regularStyle));
      }
      children.add(TextSpan(text: ', ', style: regularStyle));
    }
    children.removeLast();
    return TextSpan(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: _buildText(text));
  }
}
