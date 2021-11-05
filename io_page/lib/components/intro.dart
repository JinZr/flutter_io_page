import 'package:flutter/material.dart';

class MyIntroduction extends StatelessWidget {
  final String str = """
    I am a Postgraduate Research student in System Engineering and Engineering Management at The Chinese University of Hong Kong. My advisor is Prof. Xunying Liu. 
  """;

  @override
  Widget build(BuildContext context) {
    return Text(str,
        softWrap: true, style: TextStyle(color: Colors.black.withOpacity(0.6)));
  }
}
