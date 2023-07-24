import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/screens/details_page.dart';
import 'package:get_x_tutorial/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/details", page: () => const DetailsPage())
      ],
    );
  }
}
