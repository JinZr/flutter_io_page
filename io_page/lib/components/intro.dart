import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class MyIntroduction extends StatelessWidget {
  final String str = """
    Prof. Xunying Liu. 
  """;
  // Text(str,
  // softWrap: true, style: )
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text:
              "I am currently a Research Postgraduate student in the Department of System Engineering and Engineering Management at The Chinese University of Hong Kong. My advisor is ",
          style: TextStyle(color: Colors.black.withOpacity(0.6))),
      TextSpan(
          text: "Prof. Xunying Liu",
          style: TextStyle(color: Colors.blue.withOpacity(0.6)),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchURL("https://www1.se.cuhk.edu.hk/~xyliu/")),
    ]));
  }

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
