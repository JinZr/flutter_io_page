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
              "I am currently a Ph.D. candidate in the Department of Systems Engineering and Engineering Management at The Chinese University of Hong Kong. My supervisor is ",
          style: Theme.of(context).textTheme.titleMedium!),
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
              ". My research interests include adversarial data augmentation in the context of automatic speech recognition.",
          style: Theme.of(context).textTheme.titleMedium!),
    ]));
  }

  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';
}
