import 'package:flutter/material.dart';
import 'package:launch_urls_flutter/url_intents.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          FilledButton(
              onPressed: () async => await launchInBrowser(),
              child: const Text("Launch in Browser"))
        ],
      )),
    );
  }
}
