import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser() async {
  const url = 'https://twitter.com';

  if (!await launchUrl(Uri.parse(url))) {
    throw Exception("Could not launch url");
  }
}

Future<void> launchInWebView() async {
  const url = 'https://twitter.com';

  if (!await launchUrl(Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          enableDomStorage: true,
          enableJavaScript: true,
          headers: <String, String>{'header key': 'header value'}))) {
    throw Exception("Could not launch url");
  }
}
