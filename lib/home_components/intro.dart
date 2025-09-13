import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';
import 'package:zr_jin_page/theme/clickable_text_theme.dart';

class MyIntroduction extends StatelessWidget {
  const MyIntroduction({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                "I received my B.Eng. degree in Software Engineering from Dalian University of Technology and completed my Ph.D. in Systems Engineering and Engineering Management at The Chinese University of Hong Kong under the supervision of ",
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          TextSpan(
            text: "Prof. Xunying Liu",
            style: clickableTextStyle(
              Theme.of(context).colorScheme.primary,
              Theme.of(context).textTheme.bodyMedium!.fontSize!,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchURL("https://www1.se.cuhk.edu.hk/~xyliu/"),
          ),
          TextSpan(
            text:
                ". My doctoral research centered on adversarial and reinforcement learning based data augmentation for automatic speech recognition, with a particular focus on dysarthric and elderly speech. I am currently a Postdoctoral Researcher at Tsinghua University working with ",
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          TextSpan(
            text: "Prof. Chao Zhang",
            style: clickableTextStyle(
              Theme.of(context).colorScheme.primary,
              Theme.of(context).textTheme.bodyMedium!.fontSize!,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchURL("https://mi.eng.cam.ac.uk/~cz277/"),
          ),
          TextSpan(
            text:
                ", where my research explores multimodal foundation models for speech and physiological signal processing, including applications in sleep studies, speech disorders, and clinical health assessment.",
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
        ],
      ),
    );
  }
}
