import 'package:url_launcher/url_launcher_string.dart';

Future<bool> launchURL(String url) async => await canLaunchUrlString(url)
    ? await launchUrlString(url)
    : throw 'Could not launch $url';
