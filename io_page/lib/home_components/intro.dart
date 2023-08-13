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
              "I obtained my B.Eng. degree from the School of Software Engineering, Dalian University of Technology, and am presently pursuing my Ph.D. in the Department of Systems Engineering and Engineering Management at The Chinese University of Hong Kong, where I am being supervised by ",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!)),
      TextSpan(
          text: "Prof. Xunying Liu",
          style: clickableTextStyle(
            Theme.of(context).colorScheme.primary,
            Theme.of(context).textTheme.titleMedium!.fontSize!,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchURL("https://www1.se.cuhk.edu.hk/~xyliu/")),
      TextSpan(
          text:
              ". My research is focused on exploring the application of adversarial learning based data augmentation techniques to enhance the performance of automatic speech recognition models. Through my work, I aim to contribute to the development of more robust and accurate speech recognition systems.",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!)),
    ]));
  }

  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';
}
