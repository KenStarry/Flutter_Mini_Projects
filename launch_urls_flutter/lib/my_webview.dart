import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final PlatformWebViewControllerCreationParams params;
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{});
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
    ..scrollTo(0, 0)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.red)
      ..setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
        debugPrint('Web View is Loading : (Progress : $progress)');
        const CircularProgressIndicator();
      }, onPageStarted: (String url) {
        debugPrint('Web View has Started : $url');
      }, onPageFinished: (String url) {
        debugPrint('Web View has Finished : $url');
      }, onWebResourceError: (WebResourceError error) {
        debugPrint('''
          Page Resource Load Error:
          code: ${error.errorCode}
          description: ${error.description}
          ''');
      }))
      ..addJavaScriptChannel('Toast message',
          onMessageReceived: (JavaScriptMessage message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.message)));
      })
      ..loadRequest(Uri.parse('https://pub.dev'));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _webViewController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _webViewController)),
    );
  }
}
