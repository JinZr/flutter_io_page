import 'package:url_launcher/url_launcher_string.dart';

typedef UrlCheck = Future<bool> Function(String url);
typedef UrlLaunch = Future<bool> Function(String url);

Future<bool> launchURL(
  String url, {
  UrlCheck? canLaunch,
  UrlLaunch? launch,
}) async {
  final check = canLaunch ?? canLaunchUrlString;
  final launcher = launch ?? launchUrlString;
  return await check(url) ? await launcher(url) : throw 'Could not launch $url';
}
