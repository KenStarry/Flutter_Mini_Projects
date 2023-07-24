import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/screens/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("hello getX"),
            FilledButton(
              onPressed: () => Get.to(() => const DetailsPage()),
              child: Text("Go to details page"),
            ),
            FilledButton(
              onPressed: () => Get.toNamed("/details"),
              child: Text("Go to details page Named"),
            ),
            FilledButton(
              onPressed: () => Get.toNamed("/details", arguments: {
                'title': "Hello There",
              }),
              child: Text("Go to details pass argumnets"),
            ),
          ],
        ),
      ),
    );
  }
}
