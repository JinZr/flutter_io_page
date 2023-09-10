import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';
import 'package:zr_jin_page/theme/clickable_text_theme.dart';

class MyIntroduction extends StatelessWidget {
  final String str = "Prof. Xunying Liu";

  const MyIntroduction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text:
              "I obtained my B.Eng. degree from the School of Software Engineering, Dalian University of Technology, and am presently pursuing my Ph.D. in the Department of Systems Engineering and Engineering Management at The Chinese University of Hong Kong, where I am being supervised by ",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!)),
      TextSpan(
          text: str,
          style: clickableTextStyle(Theme.of(context).colorScheme.primary,
              Theme.of(context).textTheme.titleMedium!.fontSize!),
          recognizer: TapGestureRecognizer()
            ..onTap = () => launchURL("https://www1.se.cuhk.edu.hk/~xyliu/")),
      TextSpan(
          text:
              ". My research focuses on exploring the application of adversarial learning based data augmentation techniques to enhance the performance of automatic speech recognition models. ",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!))
    ]));
  }
}
