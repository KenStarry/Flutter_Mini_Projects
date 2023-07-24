import 'package:flutter/material.dart';
import 'package:launch_urls_flutter/my_webview.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWebView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

