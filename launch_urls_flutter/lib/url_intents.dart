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

Future<void> makePhoneCall() async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: '+254700692069'
  );

  await launchUrl(launchUri);
}

Future<void> openWhatsApp() async {
  final Uri launchUri = Uri.parse('whatsapp://send?phone=254700692069text=Hello World');

  await launchUrl(launchUri, mode: LaunchMode.externalApplication);
}

Future<void> openTelegram() async {
  final Uri launchUri = Uri.parse('https://t.me/+sjOcvz4VfEc5NTRk');

  await launchUrl(launchUri, mode: LaunchMode.externalApplication);
}
