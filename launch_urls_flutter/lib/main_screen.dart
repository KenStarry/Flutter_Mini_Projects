import 'package:flutter/material.dart';
import 'package:launch_urls_flutter/url_intents.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
            FilledButton(
                onPressed: () async => await launchInBrowser(),
                child: const Text("Launch in Browser")),

            FilledButton(
                onPressed: () async => await launchInBrowser(),
                child: const Text("Launch in Web View")),
        ],
      ),
          )),
    );
  }
}
