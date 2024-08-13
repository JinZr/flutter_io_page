import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';
import 'package:zr_jin_page/theme/clickable_text_theme.dart';

class MyIntroduction extends StatelessWidget {
  final String str = "Prof. Xunying Liu";

  const MyIntroduction({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text:
              "I obtained my B.Eng. degree from the School of Software Engineering, Dalian University of Technology, and am presently pursuing my Ph.D. in the Department of Systems Engineering and Engineering Management at The Chinese University of Hong Kong, where I am being supervised by ",
          style: Theme.of(context).textTheme.bodyLarge!),
      TextSpan(
          text: str,
          style: clickableTextStyle(Theme.of(context).colorScheme.primary,
              Theme.of(context).textTheme.bodyLarge!.fontSize!),
          recognizer: TapGestureRecognizer()
            ..onTap = () => launchURL("https://www1.se.cuhk.edu.hk/~xyliu/")),
      TextSpan(
          text:
              ". My research focuses on exploring the application of adversarial learning based data augmentation techniques to enhance the performance of automatic speech recognition models. ",
          style: Theme.of(context).textTheme.bodyLarge!)
    ]));
  }
}
