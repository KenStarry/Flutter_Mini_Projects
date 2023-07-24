import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_tutorial/main_screen.dart';

void main() async {

  // WidgetsFlutterBinding.ensureInitialized();

  //  initialize hive
  await Hive.initFlutter();

  //  creating a database called myBox (Hive stored data in form of boxes)
  var box = await Hive.openBox("myBox");

  runApp(const MaterialApp(
    home: MainScreen(),
    debugShowCheckedModeBanner: false,
  ));
}