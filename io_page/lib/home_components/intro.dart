import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import '../theme/clickable_text_theme.dart';

class MyIntroduction extends StatelessWidget {
  final String str = """
    Prof. Xunying Liu. 
  """;

  const MyIntroduction({Key? key}) : super(key: key);
  // Text(str,
  // softWrap: true, style: )
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text:
              "I am currently a Research Postgraduate student in the Department of Systems Engineering and Engineering Management at The Chinese University of Hong Kong. My supervisor is ",
          style: Theme.of(context).textTheme.bodyMedium!),
      TextSpan(
          text: "Prof. Xunying Liu",
          style: clickableTextStyle(
              Theme.of(context).brightness == Brightness.light,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).textTheme.bodyMedium!.fontSize!),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchURL("https://www1.se.cuhk.edu.hk/~xyliu/")),
      TextSpan(text: ".", style: Theme.of(context).textTheme.bodyMedium!),
    ]));
  }

  _launchURL(String url) async =>
      await canLaunchUrlString(url) ? await launchUrlString(url) : throw 'Could not launch $url';
}
