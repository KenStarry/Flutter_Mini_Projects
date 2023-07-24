import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser() async {
  const url = 'https://twitter.com';

  if (!await launchUrl(Uri.parse(url))) {
    throw Exception("Could not launch url");
  }
}